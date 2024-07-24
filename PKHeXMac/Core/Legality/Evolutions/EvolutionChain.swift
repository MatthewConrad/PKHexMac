//
//  EvolutionChain.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/14/24.
//

import Foundation

/// Logic to create an `EvolutionHistory`
enum EvolutionChain {
    /// Build an `EvolutionHistory` for the given `pk` and `enc`.
    static func getEvolutionChainsAllGens(pk: PKMProtocol, enc: EncounterTemplate) -> EvolutionHistory {
        let min = getMinLevel(pk: pk, enc: enc)
        let origin = EvolutionOrigin(species: pk.species, version: enc.version, generation: enc.generation, levelMin: min, levelMax: pk.currentLevel)

        return if !pk.isEgg && !(enc is EncounterInvalid) {
            getEvolutionChainsSearch(pk: pk, origin: origin, context: enc.context, encSpecies: enc.species)
        } else {
            getEvolutionChainsSearch(pk: pk, origin: origin, context: pk.context, encSpecies: enc.species)
        }
    }

    /// Build an `EvolutionHistory` for the given `pk` and `enc`.
    static func getEvolutionChainsSearch(pk: PKMProtocol, origin: EvolutionOrigin, context: EntityContext, encSpecies: Species = .None) -> EvolutionHistory {
        var chain = Array(repeating: EvoCriteria(), count: EvolutionTree.maxEvolutions)
        return evolutionChainsSearch(pk: pk, origin: origin, context: context, encSpecies: encSpecies, chain: &chain)
    }

    private static func getMinLevel(pk: PKMProtocol, enc: EncounterTemplate) -> UInt8 {
        switch enc.generation {
        case 2:
            guard let caught2 = pk as? CatchableGen2 else {
                return enc.levelMin
            }

            return max(caught2.metLevel, enc.levelMin)
        case _ where enc.generation <= 4 && enc.generation != pk.format:
            return enc.levelMin
        default:
            return max(pk.metLevel, enc.levelMin)
        }
    }

    private static func evolutionChainsSearch(pk: PKMProtocol, origin: EvolutionOrigin, context: EntityContext, encSpecies: Species, chain: inout [EvoCriteria]) -> EvolutionHistory {
        let history = EvolutionHistory()
        let length = getOriginChain(result: &chain, pk: pk, origin: origin, encSpecies: encSpecies, discard: origin.isDiscardRequired(format: pk.format))
        var chainContext = context

        if length == 0 {
            return history
        }

        chain = Array(chain[..<length])

        // update the chain to only include current species, leave future evos unknown
        if encSpecies != .None {
            EvolutionUtil.conditionBaseChainForward(result: &chain, encSpecies: encSpecies)
        }

        if chainContext == .Gen2 {
            // TODO: EvolutionGroup2
            // TODO: EvolutionGroup1
            if pk.format > 2 {
                // skip forward to Gen7
                chainContext = .Gen7
            } else {
                // no more possible contexts, so done
                return history
            }
        }

        var group = EvolutionGroupUtil.getGroup(context: chainContext)
        while true {
            _ = group.evolve(result: &chain, pk: pk, enc: origin, history: history)
            let previous = group.getNext(pk: pk, enc: origin)

            guard let prev = previous else {
                break
            }

            group = prev
        }

        return history
    }

    /// Gets a list of `EvoCriteria` that represent the possible original states of the `pk`
    static func getOriginChain(pk: PKMProtocol, origin: EvolutionOrigin, encSpecies: Species = .None, discard: Bool = true) -> [EvoCriteria] {
        var result = Array(repeating: EvoCriteria(), count: EvolutionTree.maxEvolutions)

        let count = getOriginChain(result: &result, pk: pk, origin: origin, encSpecies: encSpecies, discard: discard)

        if count == 0 {
            return []
        }

        var chain = Array(result[..<count])

        if isMetLost(pk: pk, origin: origin) {
            EvolutionUtil.conditionEncounterNoMet(chain: &chain)
        }

        return chain
    }

    /// Gets a list of `EvoCriteria` that represent the possible original states of the `pk`
    /// - returns: number of valid evolutions found
    static func getOriginChain(result: inout [EvoCriteria], pk: PKMProtocol, origin: EvolutionOrigin, encSpecies: Species = .None, discard: Bool = true) -> Int {
        let species = encSpecies
        let form = pk.form

        if pk.isEgg && !origin.skipChecks {
            result[0] = EvoCriteria(species: species, form: form, levelMin: origin.levelMax, levelMax: origin.levelMax, levelUpRequired: 0, method: .UNUSED)
            return 1
        }

        result[0] = EvoCriteria(species: species, form: form, levelMin: 0, levelMax: origin.levelMax, levelUpRequired: 0, method: .UNUSED)

        let count = devolveFrom(result: &result, pk: pk, origin: origin, context: pk.context, encSpecies: encSpecies, discard: discard)

        var chain = Array(result[..<count])
        EvolutionUtil.cleanDevolve(result: &chain, levelMin: origin.levelMin)
        return count
    }

    private static func isMetLost(pk: PKMProtocol, origin: EvolutionOrigin) -> Bool {
        switch origin.generation {
        case _ where origin.generation >= 5:
            return false
        case _ where origin.generation <= 2 && !(pk is CatchableGen2):
            return pk.metLevel != 0
        default:
            return origin.generation != pk.format
        }
    }

    private static func devolveFrom(result: inout [EvoCriteria], pk: PKMProtocol, origin: EvolutionOrigin, context: EntityContext, encSpecies: Species, discard: Bool) -> Int {
        var group: EvolutionGroup = EvolutionGroupUtil.getGroup(context: context)

        while true {
            _ = group.devolve(result: &result, pk: pk, enc: origin)
            let previous = group.getPrevious(pk: pk, enc: origin)

            guard let prev = previous else {
                break
            }

            group = prev
        }

        if discard {
            group.discardForOrigin(result: &result, pk: pk, enc: origin)
        }

        if encSpecies == .None {
            return EvolutionUtil.indexOf(result: result, species: encSpecies) + 1
        }

        return getCount(result: result)
    }

    /// Gest the count of entries that are not empty
    private static func getCount(result: [EvoCriteria]) -> Int {
        return result.filter { $0.species != .None }.count
    }
}
