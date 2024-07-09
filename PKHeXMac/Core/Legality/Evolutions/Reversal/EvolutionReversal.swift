//
//  EvolutionReversal.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/8/24.
//

import Foundation

enum EvolutionReversal {
    private static func getLevelUp(flag: UInt8, currentMaxLevel: UInt8, tweak: EvolutionRuleTweak) -> UInt8 {
        return if flag == 0 {
            0
        } else if currentMaxLevel == 100 && tweak.allowLevelUpEvolution100 {
            0
        } else {
            flag
        }
    }

    /// Short cut to initialize an `EvoCriteria` with specific logic for min & required levels.
    static func create(link: EvolutionLink, currentMaxLevel: UInt8, tweak: EvolutionRuleTweak) -> EvoCriteria {
        let method = link.method.method
        let levelMin = link.method.level
        let levelUpRequired = getLevelUp(flag: link.method.levelUp, currentMaxLevel: currentMaxLevel, tweak: tweak)

        return EvoCriteria(species: link.species, form: link.form, levelMin: levelMin, levelMax: currentMaxLevel, levelUpRequired: levelUpRequired, method: method)
    }

    static func devolve(lineage: EvolutionLookup, result: inout [EvoCriteria], head: EvoCriteria, pk: PKMProtocol, currentMaxLevel: UInt8, levelMin: UInt8, skipChecks: Bool, stopSpecies: Species, tweak: EvolutionRuleTweak) -> Int {
        // There aren't any circular evolution paths, and all lineages have at most 3 evolutions total.
        // There also aren't any convergent evolution paths, so only yield the first connection.
        var counter = 1
        var levelMax = currentMaxLevel
        while head.species != stopSpecies {
            let node = lineage[head.species, head.form]

            let (success, evoResult) = node.tryDevolve(pk: pk, currentMaxLevel: levelMax, levelMin: levelMin, skipChecks: skipChecks, tweak: tweak)

            if !success {
                return counter
            }

            counter += 1
            result[counter] = evoResult
            levelMax -= evoResult.levelUpRequired
        }

        return counter
    }
}
