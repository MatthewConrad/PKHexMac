//
//  FixedIVSet.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Contains information about the specified IVs the object has.
/// - remark: formerly `IFixedIVSet`.
protocol FixedIVSet {
    /// Contains information about the specified IVs the object has.
    /// - remark: Be sure to check if there actually is a value via `IndividualValueSet.isSpecified` before using
    var IVs: IndividualValueSet { get }
}
