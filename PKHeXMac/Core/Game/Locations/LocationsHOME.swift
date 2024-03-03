//
//  LocationsHOME.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/18/24.
//

import Foundation

enum LocationsHOME {
    // 60000 - (version - PLA)
    private static let RemapCount = 5
    static let SHVL = 59996 // VL traded to (SW)SH
    static let SWSL = 59997 // SL traded to SW(SH)
    static let SHSP = 59998 // SP traded to (SW)SH
    static let SWBD = 59999 // BD traded to SW(SH)
    static let SWLA = 60000 // PLA traded to SW(SH)

    static let SWSHEgg = 65534 // -2 = 8bNone-1..

    static func getRemapIndex(version: GameVersion) -> Int {
        return version.rawValue - GameVersion.PLA.rawValue
    }

    /// Checks whether the external entity version needs to be remapped into a location for SW/SH
    static func isVersionRemapNeeded(version: GameVersion) -> Bool {
        return getRemapIndex(version: version) < RemapCount
    }

    /// Gets the SWSH-context `GameVersion` when an external entity from the `version` resides in SWSH
    static func getVersionSWSH(version: GameVersion) -> GameVersion {
        switch version {
        case .PLA, .BD, .SL:
            return .SW
        case .SP, .VL:
            return .SH
        default:
            return version
        }
    }

    /// Gets the SWSH-context Met Location when an external entity from the `version` resides in SWSH
    static func getMetSWSH(location: Int, version: GameVersion) -> Int {
        switch version {
        case .PLA:
            return SWLA
        case .BD:
            return SWBD
        case .SP:
            return SHSP
        case .SL:
            return SWSL
        case .VL:
            return SHVL
        default:
            return location
        }
    }

    static func getVersionSWSHOriginal(location: Int) -> GameVersion {
        switch location {
        case SWLA:
            return .PLA
        case SWBD:
            return .BD
        case SHSP:
            return .SP
        case SWSL:
            return .SL
        case SHVL:
            return .VL
        default:
            return .SW
        }
    }

    /// Gets the SWSH-context Egg Location when an external entity from the input `version` resides in SWSH
    static func getLocationSWSHEgg(version: GameVersion, egg: Int) -> Int {
        if egg == 0 {
            return 0
        } else if egg > SWLA {
            return SWSHEgg
        }

        // >60000 can be reset to Link Trade (30001) then altered differently
        return getMetSWSH(location: egg, version: version)
    }

    /// Checks if the SW/SH-context Met Location is a remapped HOME location
    static func isLocationSWSH(met: Int) -> Bool {
        switch met {
        case SHVL, SWSL, SHSP, SWBD, SWLA:
            return true
        default:
            return false
        }
    }

    /// Checks if the SW/SH-context Met Location is a remapped HOME location
    static func isLocationSWSHEgg(version: GameVersion, met: Int, egg: Int, original: Int) -> Bool {
        if original > SWLA && egg == SWSHEgg {
            return true
        }

        let expected = getMetSWSH(location: original, version: version)
        return expected == met && expected == egg
    }

    /// Checks if the met location is a valid location for the `version`.
    /// - remark: Relevant when an entity from BDSP is transferred to SWSH
    static func isValidMetBDSP(location: Int, version: GameVersion) -> Bool {
        return if location == SHSP && version == .SH {
            true
        } else if location == SWBD && version == .SW {
            true
        } else {
            false
        }
    }

    /// Checks if the met location is a valid location for the `version`.
    /// - remark: Relevant when an entity from SV is transferred to SWSH
    static func isValidMetSV(location: Int, version: GameVersion) -> Bool {
        return if location == SHVL && version == .SH {
            true
        } else if location == SWSL && version == .SW {
            true
        } else {
            false
        }
    }

    /// Checks if the location is remapped based on visitation options.
    /// - remark: Relevant when a side data yields SWSH side data with a higher priority than the original
    static func getRemapState(original: EntityContext, current: EntityContext) -> LocationRemapState {
        if current == original {
            return LocationRemapState.Original
        } else if current == EntityContext.Gen8 {
            return LocationRemapState.Remapped
        }

        let generation = original.generation()
        if generation < 8 {
            return LocationRemapState.Original
        } else if generation == 8 {
            return LocationRemapState.Either
        } else if [EntityContext.Gen8a, EntityContext.Gen8b].contains(current) {
            return LocationRemapState.Either
        } else {
            return LocationRemapState.Original
        }
    }

    static func isMatchLocation(original: EntityContext, current: EntityContext, met: Int, expected: Int, version: GameVersion) -> Bool {
        let remapped = getRemapState(original: original, current: current)
        switch remapped {
        case LocationRemapState.Original:
            return met == expected
        case LocationRemapState.Remapped:
            return met == getMetSWSH(location: expected, version: version)
        case LocationRemapState.Either:
            return met == expected || met == getMetSWSH(location: expected, version: version)
        default:
            return false
        }
    }
}
