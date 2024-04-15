//
//  FixedGender.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Contains information about the initial gender of the encounter.
/// - remark: formerly `IFixedGender`
protocol FixedGender {
    /// Magic gender index for the encounter.
    var gender: UInt8 { get }

    /// Indicates if the gender is a single value (not random).
    var isFixedGender: Bool { get }
}

extension FixedGender {
    var genderRandom: UInt8 {
        0xFF
    }

    var isFixedGender: Bool {
        self.gender != self.genderRandom
    }
}
