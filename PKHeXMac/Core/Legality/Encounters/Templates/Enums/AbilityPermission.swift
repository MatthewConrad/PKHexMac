//
//  AbilityPermission.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// PKM.Ability legality permissions.
enum AbilityPermission: Int8 {
    case any12H = -1,
         any12 = 0,
         onlyFirst = 1,
         onlySecond = 2,
         onlyHidden = 4

    /// Returns the value for the given index.
    func getSingleValue() -> UInt8 {
        switch self {
        case .onlyFirst:
            return 0
        case .onlySecond:
            return 1
        case .onlyHidden:
            return 2
        default:
            fatalError("Invalid value: \(self)")
        }
    }

    /// Returns the Ability Permission value for the given index.
    func isSingleValue() -> (index: Int, success: Bool) {
        switch self {
        case .onlyFirst:
            return (0, true)
        case .onlySecond:
            return (1, true)
        case .onlyHidden:
            return (2, true)
        default:
            return (0, false)
        }
    }

    /// Indicates if the given AbilityPermission can be initially obtained with a hidden ability.
    func canBeHidden() -> Bool {
        switch self {
        case .any12H, .onlyHidden:
            return true
        default:
            return false
        }
    }
}

enum HiddenAbilityPermission: UInt8 {
    case never,
         always,
         possibel
}
