//
//  PKM.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

protocol PKM: SpeciesForm, BattleStats, BattleMoves, Ganbaru, TrainerID32, Meetable, Hatchable {
    var context: EntityContext { get }
}

extension PKM {
    
    /// Gets the max possible value that can be stored for the specific stat.
    func getMaxGanbaru(index: Int) -> UInt8 {
        let iv = self.ivs[index]
        return Self.getMaxGanbaru(iv: iv)
    }
    
}
