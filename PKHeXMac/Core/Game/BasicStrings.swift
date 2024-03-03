//
//  BasicStrings.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/7/24.
//

import Foundation

/// Protocol with minimal support for game strings.
protocol BasicStrings {
    var species: [String] { get }
    var item: [String] { get }
    var move: [String] { get }
    var ability: [String] { get }
    var types: [String] { get }
    var natures: [String] { get }

    /// Name an Egg has when obtained on this language
    var eggName: String { get }
}
