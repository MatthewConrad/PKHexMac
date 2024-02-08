//
//  IBasicStrings.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/7/24.
//

import Foundation

/// Protocol with minimal support for game strings.
protocol IBasicStrings {
    var Species: [String] { get }
    var Item: [String] { get }
    var Move: [String] { get }
    var Ability: [String] { get }
    var Types: [String] { get }
    var Natures: [String] { get }
    
    /// Name an Egg has when obtained on this language
    var EggName: String { get }
}
