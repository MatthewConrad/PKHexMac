//
//  EvolutionLookup.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/8/24.
//

import Foundation

protocol EvolutionLookup {
    subscript(species: Species, form: UInt8) -> EvolutionNode { get }
}

extension EvolutionLookup {
    /// Reverse from current state to see what evolutions the `pk` may have existed as.
    func devolve(result: inout [EvoCriteria], head: EvoCriteria, species: Species, form: UInt8, pk: PKMProtocol, levelMax: inout UInt8, levelMin: UInt8, skipChecks: Bool, stopSpecies: Species, tweak: EvolutionRuleTweak) -> Int {
        var head = result.count > 0 ? result[0] : EvoCriteria(species: species, form: form, levelMin: 0, levelMax: levelMax, levelUpRequired: 0, method: .invalid)

        let counter = EvolutionReversal.devolve(lineage: self, result: &result, head: head, pk: pk, currentMaxLevel: levelMax, levelMin: levelMin, skipChecks: skipChecks, stopSpecies: stopSpecies, tweak: tweak)

        var devolveResult = Array(result.prefix(counter))
        EvolutionUtil.cleanDevolve(result: &devolveResult, levelMin: levelMin)

        return counter
    }
}
