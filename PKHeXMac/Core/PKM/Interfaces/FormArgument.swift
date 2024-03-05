//
//  FormArgument.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

/// Exposes associated values for alternate form data.
/// - remark:
///     Furfrou: How long (days) the form can last before reverting to Form-0
///     Hoopa: How long (days) the form can last before reverting to Form-0
///     Alcremie: Topping (Strawberry, Star, etc)
///     Yamask, Runerigus: How much damage the Pokemon has taken as Yamask-1
///     Stantler: How many times the Pokemon has used Psyshield Bash - Agile
///     Qwilfish: How many times the Pokemon has used Barb Barrage - Strong
///     Basculin: How much recoil damage the Pokemon has taken as Basculin-2
///     Primeape: How many times the Pokemon has used Rage Fist
///     Bisharp: How many Bisharp that head a group of Pawniard have been KOed
///     Gimmighoul: How many Gimmighoul Coins were in the player's Bag after last levelup
///     Gholdengo: How many Gimmighoul Coins were used on Gimmighoul to evole.
///     Koraidon, Miraido: Flags whether this Pokemon was originally in Ride Form
protocol FormArgument {
    /// Argument for the associated Form.
    var formArgument: Int { get set }
    /// Amount of days the timed Form will remain active for.
    var formArgumentRemain: UInt8 { get set }
    /// Amount of days the timed Form has been active for.
    var formArgumentElapsed: UInt8 { get set }
    /// Max amount of days the Furfrou has maintained a Form without reverting.
    var formArgumentMaximum: UInt8 { get set }
}

extension FormArgument {
    /// Gets the maximum value the FormArgument can be.
    static func getFormArgumentMax(species: Species, form: UInt8, context: EntityContext) -> Int {
        let gen = context.generation()

        if gen <= 5 {
            return 0
        }

        switch species {
        case .Furfrou where form != 0:
            return 5
        case .Hoopa where form == 1:
            return 3
        case .Yamask where form == 1, .Runerigus where form == 0:
            return 9999
        case .Alcremie:
            return AlcremieDecoration.Ribbon.rawValue
        case .Qwilfish where form == 1 && gen >= 8, .Overqwil:
            return 9999
        case .Stantler where gen >= 8, .Wyrdeer where gen >= 8:
            return 9999
        case .Basculin where form == 2, .Basculegion:
            return 9999
        case .Primeape where gen >= 8, .Annihilape where gen >= 8:
            return 9999
        case .Bisharp where gen >= 8, .Kingambit where gen >= 8:
            return 9999
        case .Gimmighoul:
            return 998
        case .Gholdengo:
            return 999
        case .Koraidon, .Miraidon:
            return 1
        default:
            return 0
        }
    }

    /// Gets the minimum value the FormArgument can be to satisfy an evolution requirement.
    static func getFormArgumentMinEvolution(currentSpecies: Species, originalSpecies: Species) -> Int {
        switch originalSpecies {
        case .Yamask where currentSpecies == .Runerigus:
            return 49
        case .Qwilfish where currentSpecies == .Overqwil:
            return 20
        case .Stantler where currentSpecies == .Wyrdeer:
            return 20
        case .Basculin where currentSpecies == .Basculegion:
            return 294
        case .Mankey where currentSpecies == .Annihilape, .Primeape where currentSpecies == .Annihilape:
            return 20
        case .Pawniard where currentSpecies == .Kingambit, .Bisharp where currentSpecies == .Kingambit:
            return 3
        case .Gimmighoul where currentSpecies == .Gholdengo:
            return 999
        default:
            return 0
        }
    }

    /// Checks if the FormArgument is stored as a days-elapsed / days-remaining pair.
    static func isFormArgumentTypeDatePair(species: Species, form: UInt8) -> Bool {
        switch species {
        case .Furfrou where form != 0:
            return true
        case .Hoopa where form == 1:
            return true
        default:
            return false
        }
    }

    // TODO: implement setSuggestedFormArgument on PKM
    // TODO: implement changeFormArgument on PKM

    mutating func changeFormArgument(species: Species, form: UInt8, context: EntityContext, value: Int) {
        if !Self.isFormArgumentTypeDatePair(species: species, form: form) {
            self.formArgument = value
            return
        }

        let maxVal = Self.getFormArgumentMax(species: species, form: form, context: context)
        self.formArgumentRemain = UInt8(value)

        if context.generation() >= 8 {
            if value == maxVal || (value == 0 && species == .Hoopa && form == 1) {
                self.formArgumentElapsed = 0
                self.formArgumentMaximum = 0
                return
            }
        }

        let elapsed = maxVal < value ? 0 : UInt8(maxVal - value)
        self.formArgumentElapsed = elapsed

        if species == .Furfrou {
            self.formArgumentMaximum = max(self.formArgumentMaximum, elapsed)
        }
    }
}
