//
//  EntityContext.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

/// "Context" is an existence island; data format restricts the types of changes that can be made (such as evolving).
///
/// Starting in the 8th generation games, entities can move between games with wildly different evolution rules.
/// Previous implementations of a "Format Generation" were unable to differentiate if a class object was present in one of these different-rule contexts.
/// The "Format Generation" is still a useful generalization to check if certain fields are present in the entity data, or if certain mutations are possible.
enum EntityContext: Int {
    // Generation numerically so we can cast to and from int for most cases.
    case None = 0
    case Gen1 = 1
    case Gen2 = 2
    case Gen3 = 3
    case Gen4 = 4
    case Gen5 = 5
    case Gen6 = 6
    case Gen7 = 7
    case Gen8 = 8
    case Gen9 = 9
    
    // internal separator to pivot between adjacent contexts
    case SplitInvalid
    // Let's Go
    case Gen7b
    // Legends Arceus
    case Gen8a
    // BDSP
    case Gen8b
    // internal separator to bounds check count
    case MaxInvalid
}

    
    // get the genration number of the context
    func Generation(value: EntityContext) -> Int {
        return if value.rawValue < EntityContext.SplitInvalid.rawValue {
            value.rawValue
        } else if value == EntityContext.Gen7b {
            7
        } else if value == EntityContext.Gen8a {
            8
        } else if value == EntityContext.Gen8b {
            8
        } else {
            -1
        }
    }
    
    // checks if the context is a defined value
    func IsValid (value: EntityContext) -> Bool {
        return value != EntityContext.None && value != EntityContext.SplitInvalid && value.rawValue < EntityContext.MaxInvalid.rawValue
    }
    
    // get a pre-defined single game version associated with the context
    // Game ID choice here is the developer's choice; if multiple game sets exist for a context, one from the most recent was chosen.
    func GetSingleGameVersion (value: EntityContext) -> GameVersion {
        return if value == EntityContext.Gen1 {
            GameVersion.RD
        } else if value == EntityContext.Gen2 {
            GameVersion.C
        } else if value == EntityContext.Gen3 {
            GameVersion.E
        } else if value == EntityContext.Gen4 {
            GameVersion.SS
        } else if value == EntityContext.Gen5 {
            GameVersion.W2
        } else if value == EntityContext.Gen6 {
            GameVersion.AS
        }else if value == EntityContext.Gen7 {
            GameVersion.UM
        } else if value == EntityContext.Gen8 {
            GameVersion.SH
        } else if value == EntityContext.Gen9 {
            GameVersion.VL
        }else if value == EntityContext.Gen7b {
            GameVersion.GP
        } else if value == EntityContext.Gen8a {
            GameVersion.PLA
        } else if value == EntityContext.Gen8b {
            GameVersion.BD
        } else {
            GameVersion.Unknown
        }
    }
    
    // get the game console associated with the context
    func GetConsole ( value: EntityContext) -> GameConsole {
        return if value == EntityContext.Gen1 || value == EntityContext.Gen2 {
            GameConsole.GB
        } else if value == EntityContext.Gen3 {
            GameConsole.GBA
        } else if value == EntityContext.Gen4 || value == EntityContext.Gen5 {
            GameConsole.NDS
        } else if value == EntityContext.Gen6 || value == EntityContext.Gen7 {
            GameConsole._3DS
        } else {
            GameConsole.NX
        }
    }
    
    func GetVersionLump(value: EntityContext) -> GameVersion {
        return if value == EntityContext.Gen1 {
            GameVersion.Gen1
        } else if value == EntityContext.Gen2 {
            GameVersion.Gen2
        } else if value == EntityContext.Gen3 {
            GameVersion.Gen3
        } else if value == EntityContext.Gen4 {
            GameVersion.Gen4
        } else if value == EntityContext.Gen5 {
            GameVersion.Gen5
        } else if value == EntityContext.Gen6 {
            GameVersion.Gen6
        } else if value == EntityContext.Gen7 {
            GameVersion.Gen7
        } else if value == EntityContext.Gen8 {
            GameVersion.Gen8
        } else if value == EntityContext.Gen7b {
            GameVersion.Gen7b
        } else if value == EntityContext.Gen8a {
            GameVersion.PLA
        } else if value == EntityContext.Gen8b {
            GameVersion.BDSP
        }  else if value == EntityContext.Gen9 {
            GameVersion.Gen9
        }  else {
            GameVersion.Unknown
        }
    }
    
    func GetContext(version: GameVersion) -> EntityContext {
        return if version == GameVersion.GP || version == GameVersion.GE || version == GameVersion.GO {
            EntityContext.Gen7b
        } else {
            
        }
        
    }

