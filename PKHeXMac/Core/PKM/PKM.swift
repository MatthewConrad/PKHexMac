//
//  PKM.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

protocol PKM: SpeciesForm, BattleMoves, TrainerID32 {
    var context: EntityContext { get }
}
