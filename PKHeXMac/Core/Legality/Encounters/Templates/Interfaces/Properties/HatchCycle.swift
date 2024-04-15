//
//  HatchCycle.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Contains information about the initial Hatch Cycles.
/// - remark: formerly `IHatchCycle`
protocol HatchCycle {
    /// Number of Hatch Cycles required to hatch an egg
    /// - remark: when non-zero, this value is used instead of the default value from Personal Data
    var eggCycles: UInt8 { get }
}
