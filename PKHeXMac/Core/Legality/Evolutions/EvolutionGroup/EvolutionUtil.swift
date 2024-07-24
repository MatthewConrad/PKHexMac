//
//  EvolutionUtil.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/6/24.
//

import Foundation

enum EvolutionUtil {
    static func cleanDevolve(result: inout [EvoCriteria], levelMin: UInt8) {
        // rectify minimum levels
        // trickle our two temp variables up the chain (essentially evolving from min)
        var req: UInt8 = 0
        var minLevel: UInt8 = levelMin
        var method: EvolutionType = .none

        for i in stride(from: result.count - 1, to: 0, by: -1) {
            var evo = result[i]

            let nextMin = evo.levelMin
            let nextReq = evo.levelUpRequired
            let nextMethod = evo.method

            evo.levelMin = min(evo.levelMax, minLevel)
            evo.levelUpRequired = req
            evo.method = method

            result[i] = evo

            minLevel = max(nextMin, minLevel)
            req = nextReq
            method = nextMethod
        }
    }

    static func cleanEvolve(result: inout [EvoCriteria]) -> Int {
        var i = 1
        while i < result.count {
            let next = result[i - 1]

            // Ignore levelUp byte as it can learn moves prior to evolving
            let newMax = next.levelMax
            var evo = result[i]

            if evo.levelMin > newMax - next.levelUpRequired {
                break
            }

            evo.levelMax = newMax
            result[i] = evo
            i += 1
        }

        return i
    }

    static func getLocalEvolutionArray(result: [EvoCriteria]) -> [EvoCriteria] {
        if result.isEmpty {
            return []
        }

        var array = Array(result)
        let length = cleanEvolve(result: &array)
        if length != array.count {
            array = Array(array.prefix(length))
        }

        return array
    }

    static func setHistory<T: PersonalTable>(result: inout [EvoCriteria], pt: T) -> [EvoCriteria] {
        // Get the range of {result} that is present within pt
        var start = 0, count = 0

        // find first index that exists in the game, and take while they do
        for evo in result {
            if evo.method == EvoCriteria.sentinelNotReached {
                // unable to evolve to this stage, skip everything before it
                start += count + 1
                count = 0
            } else if pt.isPresentInGame(species: evo.species, form: evo.form) {
                // found a valid entry, increment count
                count += 1
            } else if count == 0 {
                // no valid entries yet, increment start
                start += 1
            } else {
                // invalid entry, stop
                break
            }
        }

        let end = start + count
        return getLocalEvolutionArray(result: Array(result[start ..< end]))
    }

    static func discard<T: PersonalTable>(result: inout [EvoCriteria], pt: T) {
        // Iterate through result, and if entry is not present in the game, shift other entries down and zero out the last entry
        for i in 0 ..< result.count {
            let evo = result[i]

            if evo.species == .None {
                break
            }

            if pt.isPresentInGame(species: evo.species, form: evo.form) {
                continue
            }

//            shiftDown(result: &result[i ..< result.count])
        }
    }

    static func shiftDown(result: inout [EvoCriteria]) {
        for i in 1 ..< result.count {
            result[i - 1] = result[i]
        }

        result[result.count - 1] = EvoCriteria()
    }

    static func indexOf(result: [EvoCriteria], species: Species) -> Int {
        result.firstIndex { $0.species == species } ?? -1
    }

    /// Revises the `result` to account for a new maximum `level`
    static func updateCeiling(result: inout [EvoCriteria], level: UInt8) {
        for i in 0 ..< result.count {
            if result[i].species == .None {
                break
            }

            result[i].levelMax = min(result[i].levelMax, level)
        }
    }

    /// Revises the `result` to account for a new minimum `levelMin`
    static func updateFloor(result: inout [EvoCriteria], levelMin: UInt8, levelMax: UInt8) {
        // reset the head to the new levelMax, then clamp every entry's minimum to the min
        result[0].levelMax = levelMax

        for i in 0 ..< result.count {
            if result[i].species == .None {
                break
            }

            result[i].levelMin = max(result[i].levelMin, levelMin)
        }
    }

    /// Mutates the result to leave placeholder data for the species that the `encSpecies` evolves into
    static func conditionBaseChainForward(result: inout [EvoCriteria], encSpecies: Species) {
        for i in 0 ..< result.count {
            if result[i].species == encSpecies {
                break
            }

            result[i].method = EvoCriteria.sentinelNotReached
        }
    }

    static func conditionEncounterNoMet(chain: inout [EvoCriteria]) {
        // Allow for under-leveled evolutions for purposes of finding an under-leveled evolved encounter.
        // e.g., lvl 5 Silcoon encounter slot (normally needs 7)
        for i in 0 ..< chain.count {
            if chain[i].method.isLevelUpRequired() {
                chain[i].levelMin = chain[i + 1].levelMin + chain[i].levelUpRequired
            }
        }
    }
}
