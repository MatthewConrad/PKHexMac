//
//  EggSourceable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Exposes information about how moves are learned via breeding.
protocol EggSourceable {
    /// Checks if the move can be learned via breeding.
    func getIsEggMove(species: Species, form: UInt8, move: Move) -> Bool

    /// Gets the list of moves that can be herited as an egg through breeding.
    func getEggMoves(species: Species, form: UInt8) -> [Move]
}
