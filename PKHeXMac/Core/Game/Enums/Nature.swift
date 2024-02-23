//
//  Nature.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/6/24.
//

import Foundation

/// Nature ID values for the corresponding English nature name.
enum Nature: Int, CaseIterable, Comparable {
    case Hardy = 0,
    Lonely = 1,
    Brave = 2,
    Adamant = 3,
    Naughty = 4,
    Bold = 5,
    Docile = 6,
    Relaxed = 7,
    Impish = 8,
    Lax = 9,
    Timid = 10,
    Hasty = 11,
    Serious = 12,
    Jolly = 13,
    Naive = 14,
    Modest = 15,
    Mild = 16,
    Quiet = 17,
    Bashful = 18,
    Rash = 19,
    Calm = 20,
    Gentle = 21,
    Sassy = 22,
    Careful = 23,
    Quirky = 24,

    Random = 25

    /// Initializes a Nature from a raw int value, re-mapping out-of-bounds values to `Nature.Random`
    init(fromInt: Int) {
        self = Nature(rawValue: fromInt) ?? .Random
    }

    static func < (lhs: Nature, rhs: Nature) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

    /// Checks if the Nature is a valid, not-Random Nature
    /// - returns: true if Nature is an actual nature
    func isFixed() -> Bool {
        return self < .Random
    }

    /// Checks if the Nature has no stat amplifications
    /// - returns: true is the Nature does not influence stats
    func isNeutral() -> Bool {
        return self.isFixed() && self.rawValue % 6 == 0
    }

    /// Checks if the Nature is a mint nature
    /// - returns: true if the Nature can be set by a mint
    func isMint() -> Bool {
        return self.isFixed() && self.rawValue % 6 != 0 || self == .Serious
    }
}
