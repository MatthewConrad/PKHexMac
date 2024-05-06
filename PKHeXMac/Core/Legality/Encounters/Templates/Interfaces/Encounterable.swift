//
//  Encounterable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 5/5/24.
//

import Foundation

/// Common Encounter Properties base interface
/// - remark: formerly `IEncounterable`
protocol Encounterable: EncounterInfo {
    /// Short name to describe encounter data, usually just indicating which of the main component encounter types it is.
    var name: String { get }

    /// Long name to describe the encounter data, containing more details (type-specific) info
    var longName: String { get }
}
