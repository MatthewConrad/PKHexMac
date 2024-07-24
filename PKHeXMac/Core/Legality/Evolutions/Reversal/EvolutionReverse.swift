//
//  EvolutionReverse.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/8/24.
//

import Foundation

protocol EvolutionReverse {
    var lineage: EvolutionLookup { get }

    /// Gets the reverse evolution pathways for the given `species` and `form`.
    func getReverse(species: Species, form: UInt8) -> EvolutionNode

    /// Gets all species the `species`/`form` can evolve from, yielded in order of increasing evolution stage.
    func getPreEvolutions(species: Species, form: UInt8) -> AnyIterator<SpeciesForm>

    /// Tries to devolve the given `pk` to the next evolution stage.
    /// - returns: `true` if the de-evolution is possible and `result` is valid.
    func tryDevolve<T: SpeciesForm>(_ head: T, pk: PKMProtocol, currentMaxLevel: UInt8, levelMin: UInt8, skipChecks: Bool, tweak: EvolutionRuleTweak) -> (success: Bool, result: EvoCriteria)
}

extension EvolutionReverse {
    func getReverse(species: Species, form: UInt8) -> EvolutionNode {
        lineage[species, form]
    }

    func getPreEvolutions(species: Species, form: UInt8) -> AnyIterator<SpeciesForm> {
        let node = lineage[species, form]

        return AnyIterator {
            // no convergent evolutions; first method is enough
            let s = node.first

            if s.species == .None {
                return nil
            }

            for preEvo in getPreEvolutions(species: s.species, form: s.form) {
                return preEvo
            }
            return DefaultSpeciesForm(species: s.species, form: s.form)
        }
    }

    func tryDevolve<T>(_ head: T, pk: PKMProtocol, currentMaxLevel: UInt8, levelMin: UInt8, skipChecks: Bool, tweak: EvolutionRuleTweak) -> (success: Bool, result: EvoCriteria) where T: SpeciesForm {
        let node = lineage[head.species, head.form]

        return node.tryDevolve(pk: pk, currentMaxLevel: currentMaxLevel, levelMin: levelMin, skipChecks: skipChecks, tweak: tweak)
    }
}
