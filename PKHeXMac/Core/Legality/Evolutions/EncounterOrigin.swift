//
//  EncounterOrigin.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/15/24.
//

import Foundation

/// Contains logic that calcs the eovlution chain of a `PKM`, only considering its original generation.
enum EncounterOrigin {
    /// Gets possible evolution deatils for the input `pk`.
    /// - returns: possible origin `species-form-levels` to match against encounter data.
    /// - remark: use `getOriginChain12` if the `pk` originated from Gens 1 or 2
    static func getOriginChain(pk: PKMProtocol, generation: UInt8) -> [EvoCriteria] {
        let (minLevel, maxLevel) = getMinMax(pk: pk, generation: generation)
        let origin = EvolutionOrigin(species: pk.species, version: pk.version, generation: generation, levelMin: minLevel, levelMax: maxLevel)

        return EvolutionChain.getOriginChain(pk: pk, origin: origin)
    }

    /// Gets possible evolution details for an input `pk` from Gens 1 or 2
    static func getOriginChain12(pk: PKMProtocol, source: GameVersion) -> [EvoCriteria] {
        let (minLevel, maxLevel) = getMinMaxGB(pk: pk)
        let isRBY = source == .RBY
        let version = isRBY ? GameVersion.RBY : GameVersion.GSC

        let gen: UInt8 = isRBY ? 1 : 2
        let origin = EvolutionOrigin(species: pk.species, version: version, generation: gen, levelMin: minLevel, levelMax: maxLevel)

        return EvolutionChain.getOriginChain(pk: pk, origin: origin)
    }

    static func getMinMax(pk: PKMProtocol, generation: UInt8) -> (minLevel: UInt8, maxLevel: UInt8) {
        return (minLevel: pk.currentLevel, maxLevel: getLevelOriginMin(pk: pk, generation: generation))
    }

    static func getMinMaxGB(pk: PKMProtocol) -> (minLevel: UInt8, maxLevel: UInt8) {
        return (minLevel: getLevelOriginMinGB(pk: pk), maxLevel: pk.currentLevel)
    }

    private static func getLevelOriginMin(pk: PKMProtocol, generation: UInt8) -> UInt8 {
        switch generation {
        case 3:
            return getLevelOriginMin3(pk: pk)
        case 4:
            return getLevelOriginMin4(pk: pk)
        default:
            return max(1, pk.metLevel)
        }
    }

    private static func isEggLocationNonZero(pk: PKMProtocol) -> Bool {
        pk.eggLocation != LocationEdits.getNoneLocation(pk: pk)
    }

    private static func getLevelOriginMinGB(pk: PKMProtocol) -> UInt8 {
        let eggLevel: UInt8 = 5
        let minWildLevel: UInt8 = 2

        if pk.isEgg {
            return eggLevel
        }

        guard let caught2 = pk as? CatchableGen2, caught2.caughtData == 0 else {
            return minWildLevel
        }

        return caught2.metLevel
    }

    private static func getLevelOriginMin3(pk: PKMProtocol) -> UInt8 {
        let eggLevel: UInt8 = 5
        let minWildLevel: UInt8 = 2

        return if pk.format != 3 {
            minWildLevel
        } else if pk.isEgg {
            eggLevel
        } else {
            pk.metLevel
        }
    }

    private static func getLevelOriginMin4(pk: PKMProtocol) -> UInt8 {
        let eggLevel: UInt8 = 1
        let minWildLevel: UInt8 = 2

        let validEggLoc = isEggLocationNonZero(pk: pk)

        return if pk.format != 4 {
            validEggLoc ? eggLevel : minWildLevel
        } else if pk.isEgg || validEggLoc {
            eggLevel
        } else {
            pk.metLevel
        }
    }
}
