//
//  Gender.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/6/24.
//

import Foundation

/// Gender a PKM can have
enum Gender: Int, CaseIterable {
    case Male = 0,
         Female = 1,
         Genderless = 2

    /// Random is provided to the function for Encounter template values.
    static let Random: Gender = .Genderless
}
