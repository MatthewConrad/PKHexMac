//
//  FixedNature.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Contains information about the initial nature of the encounter.
/// - remark: formerly `IFixedNature`
protocol FixedNature {
    /// Magic nature index for the encounter.
    var nature: Nature { get }
}

extension FixedNature {
    /// Indicates if nature is a single value (not random).
    var isFixedNature: Bool { self.nature != .Random }
}
