//
//  Locateable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Exposes details about an encounter with a specific location ID required
/// - remark: formerly `ILocation`
protocol Locateable {
    /// Met location iD of the encounter
    var location: UInt16 { get }

    /// Egg Location ID of the encounter
    var eggLocation: UInt16 { get }
}

extension Locateable {
    func getLocation() -> UInt16 {
        self.location != 0 ? self.location : self.eggLocation
    }

    func getEncounterLocation(generation: Int, version: GameVersion = .AnyGame) -> String? {
        let loc = self.getLocation()
        if loc == 0 {
            return nil
        }

        let isEgg = loc != self.location
        // TODO: finish after GameInfo
        return ""
    }
}
