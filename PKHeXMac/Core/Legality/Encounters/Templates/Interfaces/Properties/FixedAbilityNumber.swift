//
//  FixedAbilityNumber.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Exposes details about an encounter with a specific ability index permitted.
/// - remark: formerly `IFixedAbilityNumber`
protocol FixedAbilityNumber {
    
    /// Specific ability indexes that can be acquired from this object.
    var ability: AbilityPermission { get }
}
