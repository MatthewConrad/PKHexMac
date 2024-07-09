//
//  EvolutionNode.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/8/24.
//

import Foundation

/// Stores two reverse `EvolutionLink` values instead of having a backing array.
struct EvolutionNode {
    /// First reverse evolution in the node.
    var first: EvolutionLink

    /// Second reverse evolution in the node.
    var second: EvolutionLink

    mutating func add(newLink: EvolutionLink) {
        if first.isEmpty {
            first = newLink
        } else if second.isEmpty {
            second = newLink
        } else {
            fatalError("\(self) already has two links.")
        }
    }

    /// - remark: originally declared in `EvolutionReversal`
    func tryDevolve(pk: PKMProtocol, currentMaxLevel: UInt8, levelMin: UInt8, skipChecks: Bool, tweak: EvolutionRuleTweak) -> (success: Bool, result: EvoCriteria) {
        // Multiple methods can exist to devolve the same SpeciesForm
        // the first is less restrictive (no levelUp req) if two {level/other} methods exist

        if first.isEmpty {
            return (false, EvoCriteria())
        }

        let check1 = first.method.check(pk: pk, lvl: currentMaxLevel, levelMin: levelMin, skipChecks: skipChecks, tweak: tweak)

        if check1 == .valid {
            return (true, EvolutionReversal.create(link: first, currentMaxLevel: currentMaxLevel, tweak: tweak))
        }

        if second.isEmpty {
            return (false, EvoCriteria())
        }

        let check2 = second.method.check(pk: pk, lvl: currentMaxLevel, levelMin: levelMin, skipChecks: skipChecks, tweak: tweak)

        if check2 == .valid {
            return (true, EvolutionReversal.create(link: second, currentMaxLevel: currentMaxLevel, tweak: tweak))
        }

        return (false, EvoCriteria())
    }
}
