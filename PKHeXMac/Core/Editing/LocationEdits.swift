//
//  LocationEdits.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/15/24.
//

import Foundation

/// Logic for locations of a `PKM`.
enum LocationEdits {
    /// Gets the "None" location index for a specific `PKM`
    static func getNoneLocation(pk: PKMProtocol) -> UInt16 {
        getNoneLocation(context: pk.context)
    }

    /// Gets the "None" location index for a specific `EntityContext`
    static func getNoneLocation(context: EntityContext) -> UInt16 {
        switch context {
        case .Gen8b:
            return UInt16(Locations.Default8bNone)
        default:
            return 0
        }
    }
}
