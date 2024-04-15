//
//  Moveset.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Exposes a Moveset for the object
/// - remark: formerly `IMoveset`
protocol Movesettable {
    var moves: Moveset { get }
}
