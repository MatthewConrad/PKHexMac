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
enum EntityContext: Int, CaseIterable, Comparable {
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

    static func < (lhs: EntityContext, rhs: EntityContext) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

    /// Gets the genration number of the context
    func generation() -> Int {
        return if self < EntityContext.SplitInvalid {
            self.rawValue
        } else if self == EntityContext.Gen7b {
            7
        } else if self == EntityContext.Gen8a {
            8
        } else if self == EntityContext.Gen8b {
            8
        } else {
            -1
        }
    }

    /// checks if the context is a defined value
    func isValid() -> Bool {
        return self != .None && self != .SplitInvalid && self < .MaxInvalid
    }

    /// get a pre-defined single game version associated with the context
    /// Game ID choice here is the developer's choice; if multiple game sets exist for a context, one from the most recent was chosen.
    func getSingleGameVersion() -> GameVersion {
        return if self == .Gen1 {
            GameVersion.RD
        } else if self == .Gen2 {
            GameVersion.C
        } else if self == .Gen3 {
            GameVersion.E
        } else if self == .Gen4 {
            GameVersion.SS
        } else if self == .Gen5 {
            GameVersion.W2
        } else if self == .Gen6 {
            GameVersion.AS
        } else if self == .Gen7 {
            GameVersion.UM
        } else if self == .Gen8 {
            GameVersion.SH
        } else if self == .Gen9 {
            GameVersion.VL
        } else if self == .Gen7b {
            GameVersion.GP
        } else if self == .Gen8a {
            GameVersion.PLA
        } else if self == .Gen8b {
            GameVersion.BD
        } else {
            GameVersion.Unknown
        }
    }

    /// Gets the game console associated with the context
    func getConsole() -> GameConsole {
        switch self {
        case .Gen1, .Gen2:
            return GameConsole.GB
        case .Gen3:
            return GameConsole.GBA
        case .Gen4, .Gen5:
            return GameConsole.NDS
        case .Gen6, .Gen7:
            return GameConsole._3DS
        default:
            return GameConsole.NX
        }
    }

    /// Gets the corresponding lumped GameVersion for the context.
    func getVersionLump() -> GameVersion {
        switch self {
        case .Gen1:
            return GameVersion.Gen1
        case .Gen2:
            return GameVersion.Gen2
        case .Gen3:
            return GameVersion.Gen3
        case .Gen4:
            return GameVersion.Gen4
        case .Gen5:
            return GameVersion.Gen5
        case .Gen6:
            return GameVersion.Gen6
        case .Gen7:
            return GameVersion.Gen7
        case .Gen8:
            return GameVersion.Gen8
        case .Gen9:
            return GameVersion.Gen9
        case .Gen7b:
            return GameVersion.Gen7b
        case .Gen8a:
            return GameVersion.PLA
        case .Gen8b:
            return GameVersion.BDSP
        default:
            return GameVersion.Unknown
        }
    }

    /// Gets all GameVersion values within the context.
    func getVersionsWithin(source: [GameVersion]) -> [GameVersion] {
        return self.getVersionLump().getVersionsWithinRange(source: source)
    }

    /// Gets the corresponding EntityContext for a given GameVerson
    /// - parameters:
    ///     - version: a `GameVersion` to get the context for
    /// - returns: the `EntityContext`
    static func getContext(version: GameVersion) -> EntityContext {
        switch version {
        case GameVersion.GP, GameVersion.GE, GameVersion.GO:
            return .Gen7b
        case GameVersion.PLA:
            return .Gen8a
        case GameVersion.BD, GameVersion.SP:
            return .Gen8b
        default:
            return EntityContext(rawValue: version.getGeneration()) ?? .None
        }
    }
}
