//
//  RegionOrigin.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/18/24.
//

import Foundation

/// Exposes details about the 3DS Console geolocation settings set by the trainer.
protocol RegionOrigin {
    /// Console hardware region.
    var consoleRegion: UInt8 { get set }

    /// Console's configured country via system settings.
    var country: UInt8 { get set }

    /// Consoles' configured region within `country` via system settings.
    var region: UInt8 { get set }
}

extension RegionOrigin {
    mutating func setDefaultRegionOrigins(language: Int) {
        if language == 1 {
            consoleRegion = 0 // Japan
            country = 1 // Japan
            region = 0
        } else {
            consoleRegion = 1 // North America
            country = 49 // USA
            region = 7 // California
        }
    }

    /// - remark: this is reversed from the original C# implementation
    mutating func copyRegionOrigin(from: RegionOrigin) {
        consoleRegion = from.consoleRegion
        country = from.country
        region = from.region
    }

    mutating func clearRegionOrigin() {
        consoleRegion = 0
        country = 0
        region = 0
    }
}
