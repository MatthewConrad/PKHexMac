//
//  EncounterTemplate.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 5/5/24.
//

import Foundation

protocol EncounterTemplate: SpeciesForm, Version, Generation, Shinyable, LevelRange, Locateable, FixedAbilityNumber, FixedBall, ShinyPotential {
    /// Original context
    var context: EntityContext { get }

    /// Indicates if the encounter originated as an egg.
    var isEgg: Bool { get }
}

extension EncounterTemplate {
    // TODO: add
    func isWithinEncounterRange(pk: PKMProtocol) -> Bool {
        let level = pk.currentLevel

        if !pk.hasOriginalMetLocation {
            return self.isLevelWithinRange(lvl: level)
        } else if self.isEgg {
            return level == self.levelMin
            // else if mysterygift...
        } else {
            let met = pk.metLevel
            return if met != 0 {
                level == met
            } else {
                self.isLevelWithinRange(lvl: level)
            }
        }
    }
}
