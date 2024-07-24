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

/// Exposes what move IDs are in the relearn moves list on encounter.
/// - remark: formerly `IRelearn`
protocol Relearn {
    /// Move IDs are in the relearn moves list on encounter.
    var relearn: Moveset { get }
}
