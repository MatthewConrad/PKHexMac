//
//  EncounterArea.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 5/5/24.
//

import Foundation

/// Contains a location of `Slots` for the area.
/// - remark: formerly `IEncounterArea<T>`
protocol EncounterArea {
    var slots: [EncounterTemplate] { get }
}

/// Area contains matching location logic.
/// - remark formerly `IAreaLocation`
protocol AreaLocation {
    func isMatchLocation(location: UInt16) -> Bool
}
