//
//  NumberedSlot.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/15/24.
//

import Foundation

/// `EncounterTemplate` that contains info about what index it is within the area's type-group slots.
/// - remark: Useful for checking legality (if RNG can yield this slot)
///           Formerly `INumberedSlot`
protocol NumberedSlot {
    /// Number index of the `EncounterTemplate`
    var slotNumber: UInt8 { get }
}
