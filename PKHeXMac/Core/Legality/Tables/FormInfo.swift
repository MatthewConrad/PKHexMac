//
//  FormInfo.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/1/24.
//

import Foundation

enum FormInfo {
    /// Species that can change to another form of a different type.
    private static let eggForms: [Species] = [.Burmy, .Furfrou, .Oricorio]

    /// Species that can change forms, regardless of origin.
    /// - remark: excluedes Zygarge, which has special conditions and is checked separately
    private static let changeForms: [Species] = eggForms + [
        .Rotom, // sometimes considered for wild encounters
        .Deoxys, .Dialga, .Palkia, .Giratina, .Shaymin, .Arceus,
        .Tornadus, .Thundurus, .Landorus, .Kyurem, .Keldeo, .Genesect,
        .Hoopa, .Silvally, .Necrozma, .Calyrex, .Enamorus, .Ogerpon,
    ]

    /// Species that have an alternate form that cannot exist outside of battle
    private static let battleForms: [Species] = [
        .Castform, .Kyogre, .Groudon, .Cherrim, .Darmanitan, .Meloetta, .Aegislash, .Xerneas, .Zygarde,
        .Wishiwashi, .Minior, .Mimikyu, .Necrozma, .Cramorant, .Morpeko, .Eiscue, .Zacian, .Zamazenta,
        .Eternatus, .Palafin, .Ogerpon, .Terapagos,
    ]

    /// Species that have a Mega form that cannot exist outside of battle.
    /// - remark: requires a held item to change form as an in-battle transformation
    private static let battleMegas: [Species] = [
        .Venusaur, .Charizard, .Blastoise, .Alakazam, .Gengar, .Kangaskhan, .Pinsir, .Gyarados,
        .Aerodactyl, .Mewtwo, .Ampharos, .Scizor, .Heracross, .Houndoom, .Tyranitar,
        .Blaziken, .Gardevoir, .Mawile, .Aggron, .Medicham, .Manectric, .Banette, .Absol, .Latios, .Latias,
        .Garchomp, .Lucario, .Abomasnow,

        // added in ORAS
        .Beedrill, .Pidgeot, .Slowbro, .Steelix, .Sceptile, .Swampert, .Sableye, .Sharpedo, .Camerupt,
        .Altaria, .Glalie, .Salamence, .Metagross, .Rayquaza, .Lopunny, .Gallade, .Audino, .Diancie,
    ]

    private static let battleFormsSet: Set<Species> = Set(battleForms + battleMegas)

    /// Species that exist as a Totem, which can be captured and owned
    /// - remark: excludes Wishiwashi since it cannot be caught
    private static let totemForms: [Species] = [
        .Raticate, .Marowak, .Gumshoos, .Vikavolt, .Ribombee, .Araquanid,
        .Lurantis, .Salazzle, .Mimikyu, .Kommoo, .Togedemaru,
    ]

    /// Species that have a Lord from in Legends: Arcues
    private static let lordForms: [Species] = [
        .Arcanine, .Electrode, .Lilligant, .Avalugg, .Kleavor,
    ]

    /// Checks if the form cannot exist outside of battle
    static func isBattleOnlyForm(species: Species, form: Int) -> Bool {
        if FormInfo.battleFormsSet.contains(species) {
            return if species == .Slowbro {
                form == 1 // Mega
            } else if species == .Darmanitan {
                (form & 1) == 1 // Zen
            } else if species == .Zygarde {
                form == 4 // Zygarde Complete
            } else if species == .Minior {
                form < 7 // Minior Shields-Down
            } else if species == .Mimikyu {
                (form & 1) == 1 // Busted
            } else if species == .Necrozma {
                form == 3 // Ultra Necrozma
            } else if species == .Ogerpon {
                form >= 4 // Embody Aspect
            } else {
                form != 0
            }
        } else {
            return false
        }
    }

    /// Reverts the Battle form to the form it would have outside of Battle
    /// - remark: only call this if you've already checked that isBattleOnlyForm returns true
    /// - parameters:
    ///     - species: the entity Species
    ///     - form: the entity Form
    ///     - format: the current Generation format
    /// - returns: suggested alt form value
    static func getOutOfBattleForm(species: Species, form: Int, format: Int) -> Int {
        if species == .Zygarde && format > 6 {
            return 3
        }

        switch species {
        case .Darmanitan:
            return form & 2
        case .Minior:
            return form + 7
        case .Mimikyu:
            return form & 2
        case .Ogerpon:
            return form & 3
        default:
            return 0
        }
    }

    /// Indicates if the form is a fused form.
    static func isFusedForm(species: Species, form: Int, format: Int) -> Bool {
        if form != 0 {
            switch species {
            case .Kyurem:
                return format >= 5
            case .Necrozma:
                return format >= 7
            case .Calyrex:
                return format >= 8
            default:
                return false
            }
        }

        return false
    }

    /// Indicates if the species should be prevents from being traded away.
    static func isUntradable(species: Species, form: Int, formArg: Int, format: Int) -> Bool {
        switch species {
        case .Koraidon, .Miraidon:
            return formArg == 1 // Ride-able Legend
        case .Pikachu:
            return format == 7 && form == 8 // LGP starter
        case .Eevee:
            return format == 7 && form == 1 // LGE Starter
        default:
            return isFusedForm(species: species, form: form, format: format)
        }
    }

    /// Checks if the form may be different from the original counter detail.
    static func isFormChangeable(species: Species, oldForm: Int, newForm: Int, origin: EntityContext, current: EntityContext) -> Bool {
        if FormInfo.changeForms.contains(species) {
            return true
        }

        // Zygarde Forms
        // Gen6 does not allow form changing;
        // Gen7 allows change to Form 2/3, but not to 0/1. A form-1 can be boosted to a form-0
        if species == .Zygarde {
            switch current {
            case .Gen6:
                return false
            case .Gen7:
                return newForm >= 2 || (oldForm == 1 && newForm == 0)
            default:
                return true
            }
        }

        if [.Deerling, .Sawsbuck].contains(species) {
            return if origin == .Gen5 {
                true // BW, B2W2 change via seasons
            } else if current.generation() >= 8 {
                true // SV change via in-game province on startup
            } else {
                false
            }
        }

        return false
    }

    static func isFormChangeEggTypes(species: Species) -> Bool {
        return FormInfo.eggForms.contains(species)
    }

    static func hasTotemForm(species: Species) -> Bool {
        return FormInfo.totemForms.contains(species)
    }

    /// Checks if the form for the Species is a Totem form
    static func isTotemForm(species: Species, form: Int) -> Bool {
        return if form == 0 || !hasTotemForm(species: species) {
            false
        } else if species == .Mimikyu {
            form == 2 || form == 3
        } else if [.Raticate, .Marowak].contains(species) {
            form == 2
        } else {
            form == 1
        }
    }

    static func isTotemForm(species: Species, form: Int, context: EntityContext) -> Bool {
        return context == .Gen7 && isTotemForm(species: species, form: form)
    }

    /// Gets the base Form for the Species when the Totem form is reverted
    static func getTotemBaseForm(species: Species, form: Int) -> Int {
        return if species == .Mimikyu {
            0
        } else {
            form - 1
        }
    }

    /// Checks if the form for the Species is a Lord form from PLA
    static func isLordForm(species: Species, form: Int) -> Bool {
        return if species == .Kleavor && form == 1 {
            true
        } else if FormInfo.lordForms.contains(species) && form == 2 {
            true
        } else {
            false
        }
    }

    static func isLordForm(species: Species, form: Int, context: EntityContext) -> Bool {
        return context == .Gen8a && isLordForm(species: species, form: form)
    }

    /// Checks if the form exists for the Species without having an associated PersonalInfo index
    static func isValidOutOfBoundsForm(species: Species, form: Int, format: Int) -> Bool {
        switch species {
        case .Unown:
            return format == 2 ? form < 26 : form < 28 // A-Z : A-Z!?
        case .Mothim:
            return form < 3 // Burmy base form is kept
        case .Scatterbug, .Spewpa: // Vivillon pre-evos
            return form <= Vivillon3DS.maxWildFormID
        default:
            return false
        }
    }

    private static func hasFormValuesNotIndicatedByPersonal(species: Species) -> Bool {
        return [.Unown, .Mothim, .Scatterbug, .Spewpa].contains(species)
    }

    /// Checks if the PKM data should have a drop-down selection visible for the form value
    static func hasFormSelection(pi: PersonalFormInfo, species: Species, format: Int) -> Bool {
        if format <= 3 && species != .Unown {
            return false
        }

        if hasFormValuesNotIndicatedByPersonal(species: species) {
            return false
        }

        return pi.formCount > 1
    }
}
