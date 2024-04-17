//
//  EvolutionRuleTweak.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/16/24.
//

import Foundation

/// Tweaks to Evolution rules to account for game-specific behaviors.
struct EvolutionRuleTweak {
    /// Allow level up evolutions if already level 100
    var allowLevelUpEvolution100: Bool = false

    /// default logic, no tweaks
    static let Default = EvolutionRuleTweak()

    /// in Scarlet/Violet, level 100 Pokemon can trigger level-up evos by Rare Candy
    static let Level100 = EvolutionRuleTweak(allowLevelUpEvolution100: true)
}
