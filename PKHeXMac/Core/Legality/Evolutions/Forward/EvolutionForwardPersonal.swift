//
//  EvolutionForwardPersonal.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/6/24.
//

import Foundation

/// Provides forward evolution pathways with reliance on personal table data for form branched evolutions.
struct EvolutionForwardPersonal: EvolutionForward {
    var entries: [[EvolutionMethod]]
    var personal: any PersonalTable
    
    /// Gets the level up requirement for the evolution
    private static func getLevelUp(flag: UInt8, currentMaxLevel: UInt8, tweak: EvolutionRuleTweak) -> UInt8 {
        return if flag == 0 {
            0
        } else if currentMaxLevel == 100 && tweak.allowLevelUpEvolution100 {
            0
        } else {
            flag
        }
    }

    /// Short cut to initialize an `EvoCriteria` with specific logic for min & required levels.
    private static func create(species: Species, form: UInt8, method: EvolutionMethod, currentMaxLevel: UInt8, min: UInt8, tweak: EvolutionRuleTweak) -> EvoCriteria {
        let levelMin = max(min + method.levelUp, method.level)
        let levelUpRequired = getLevelUp(flag: method.levelUp, currentMaxLevel: currentMaxLevel, tweak: tweak)

        return EvoCriteria(species: species, form: form, levelMin: levelMin, levelMax: currentMaxLevel, levelUpRequired: levelUpRequired, method: method.method)
    }

    func getForward(species: Species, form: UInt8) -> ArraySlice<EvolutionMethod> {
        let index = personal.getFormIndex(species: species, form: form)
        let methods = entries[index]
        return methods.prefix(methods.count)
    }

    func getEvolutions(species: Species, form: UInt8) -> AnyIterator<SpeciesForm> {
        let methods = getForward(species: species, form: form)
        return getEvolutions(evos: methods, form: form)
    }

    func tryEvolve<T>(_ head: T, next: SpeciesForm, pk: PKMProtocol, currentMaxLevel: UInt8, levelMin: UInt8, skipChecks: Bool, tweak: EvolutionRuleTweak) -> (success: Bool, result: EvoCriteria) where T: SpeciesForm {
        let evoMethods = getForward(species: head.species, form: head.form)
        for method in evoMethods {
            if method.species != next.species {
                continue
            }

            let expectForm = method.getDestinationForm(sourceForm: head.form)
            if expectForm != next.form {
                continue
            }

            let check = method.check(pk: pk, lvl: currentMaxLevel, levelMin: levelMin, skipChecks: skipChecks, tweak: tweak)
            if check != .valid {
                continue
            }

            return (true, EvolutionForwardPersonal.create(species: next.species, form: next.form, method: method, currentMaxLevel: currentMaxLevel, min: levelMin, tweak: tweak))
        }

        return (false, EvoCriteria())
    }
}
