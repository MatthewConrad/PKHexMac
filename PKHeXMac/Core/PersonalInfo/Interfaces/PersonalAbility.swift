//
//  PersonalAbility.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

protocol PersonalAbility {
    /// Gets the count of selectable abilities
    /// - remark: duplicate abilities still count separately
    var abilityCount: Int { get }

    func getIndex(ability: Ability) -> Int
    func getAbility(index: Int) -> Ability
    func getAbilities() -> [Ability]
}

protocol PersonalAbilityDual: PersonalAbility {
    var ability1: Ability { get set }
    var ability2: Ability { get set }
}

protocol PersonalAbilityHidden: PersonalAbilityDual {
    var abilityH: Ability { get set }
}

extension PersonalAbilityDual {
    func isSameAbilities() -> Bool {
        self.ability1 == self.ability2
    }
}

extension PersonalAbilityHidden {
    func isHiddenUnique() -> Bool {
        self.ability1 != self.abilityH
    }

    func canUseAbilityPatch() -> Bool {
        self.isHiddenUnique() || self.ability2 != self.abilityH
    }
}
