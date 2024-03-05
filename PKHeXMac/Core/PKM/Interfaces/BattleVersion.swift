//
//  BattleVersion.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

/// Exposes a GameVersion for allowing a Pokemon into ranked battles if it originated in an earlier game.
protocol BattleVersion {
    /// Indicates which `GameVersion` the Pokemon's moves were reset on.
    var battleVersion: GameVersion { get set }
}

extension BattleVersion {
    /// Gets the minimum Generation that the Pokemon was last reset in.
    func getMinGeneration() -> Int {
        let generation = battleVersion.getGeneration()
        return if battleVersion == .AnyGame {
            1
        } else if !battleVersion.isValidSavedVersion() {
            -1
        } else if generation >= 8 {
            generation
        } else {
            -1
        }
    }

    mutating func adaptToBattleVersion(pk: inout PKM, version: GameVersion) {
        // TODO: revisit after Moveset finished
        pk.setMoves(moves: [])

        battleVersion = version
    }
    
    // TODO: implement isBattleVersionValid 
}
