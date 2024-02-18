//
//  LocationsHOME.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/18/24.
//

import Foundation

struct LocationsHOME {
    
    // 60000 - (version - PLA)
    private static let RemapCount = 5;
    static let SHVL = 59996; // VL traded to (SW)SH
    static let SWSL = 59997; // SL traded to SW(SH)
    static let SHSP = 59998; // SP traded to (SW)SH
    static let SWBD = 59999; // BD traded to SW(SH)
    static let SWLA = 60000; // PLA traded to SW(SH)
    
    static let SWSHEgg = 65534 // -2 = 8bNone-1..
    
    static func getRemapIndex(version: Int) -> Int {
        return version - GameVersion.PLA.rawValue
    }
    
    /// Checks whether the external entity version needs to be remapped into a location for SW/SH
    static func isVersionRemapNeeded(version: Int) -> Bool {
        return getRemapIndex(version: version) < RemapCount
    }
    
    
    /// Gets the SWSH-context `GameVersion` when an external entity from the `version` resides in SWSH
    static func getVersionSWSH(version: Int) -> Int {
        switch version {
        case GameVersion.PLA.rawValue:
            return GameVersion.SW.rawValue
        case GameVersion.BD.rawValue:
            return GameVersion.SW.rawValue
        case GameVersion.SP.rawValue:
            return GameVersion.SH.rawValue
        case GameVersion.SL.rawValue:
            return GameVersion.SW.rawValue
        case GameVersion.VL.rawValue:
            return GameVersion.SH.rawValue
        default:
            return version
        }
    }
    
    /// Gets the SWSH-context Met Location when an external entity from the `version` resides in SWSH
    static func getMetSWSH(location: Int, version: Int) -> Int {
        switch version {
        case GameVersion.PLA.rawValue:
            return SWLA
        case GameVersion.BD.rawValue:
            return SWBD
        case GameVersion.SP.rawValue:
            return SHSP
        case GameVersion.SL.rawValue:
            return SWSL
        case GameVersion.VL.rawValue:
            return SHVL
        default:
            return location
        }
    }
    
    static func getVersionSWSHOriginal(location: Int) -> Int {
        switch location {
        case SWLA:
            return GameVersion.PLA.rawValue
        case SWBD:
            return GameVersion.BD.rawValue
        case SHSP:
            return GameVersion.SP.rawValue
        case SWSL:
            return GameVersion.SL.rawValue
        case SHVL:
            return GameVersion.VL.rawValue
        default:
            return Int.min
        }
    }
    
    /// Gets the SWSH-context Egg Location when an external entity from the input `version` resides in SWSH
    static func getLocationSWSHEgg(version: Int, egg: Int) -> Int {
        if egg == 0 {
            return 0;
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
    static func isLocationSWSHEgg(version: Int, met: Int, egg: Int, original: Int) -> Bool {
        if(original > SWLA && egg == SWSHEgg) {
            return true;
        }
        
        let expected = getMetSWSH(location: original, version: version)
        return expected == met && expected == egg
    }
    
    /// Checks if the met location is a valid location for the `version`.
    /// - remark: Relevant when an entity from BDSP is transferred to SWSH
    static func isValidMetBDSP(location: Int, version: Int) -> Bool {
        return if location == SHSP && version == GameVersion.SH.rawValue {
            true
        } else if location == SWBD && version == GameVersion.SW.rawValue {
            true
        } else {
            false
        }
    }
    
    /// Checks if the met location is a valid location for the `version`.
    /// - remark: Relevant when an entity from SV is transferred to SWSH
    static func isValidMetSV(location: Int, version: Int) -> Bool {
        return if location == SHVL && version == GameVersion.SH.rawValue {
            true
        } else if location == SWSL && version == GameVersion.SW.rawValue {
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
    
    static func isMatchLocation(original: EntityContext, current: EntityContext, met: Int, expected: Int, version: Int) -> Bool {
        
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
