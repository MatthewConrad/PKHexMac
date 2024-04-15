//
//  EncounterMatchRating.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

enum EncounterMatchRating: UInt16, Comparable {
    /// Matches all data, no other matches will be better.
    case match,
         /// Matches most data, may have a better match.
         deferred,
         /// Matches most data but has small errors in secondary data.
         deferredErrors,
         /// Matches some data, but will likely have a better match.
         partialMatch,
         /// Unused -- only used as an initial "max" value where anything else will be more suitable.
         maxNotMatch

    static func < (lhs: EncounterMatchRating, rhs: EncounterMatchRating) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
