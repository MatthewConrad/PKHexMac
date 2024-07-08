//
//  EvolutionForwardSpecies.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/6/24.
//

import Foundation

/// Provides forward evolution pathways based only on species.
struct EvolutionForwardSpecies: EvolutionForward {
    var entries: [[EvolutionMethod]]

    /// Short cut to initialize an `EvoCriteria` with specific logic for min & required levels.
    private static func create(species: Species, form: UInt8, method: EvolutionMethod, currentMaxLevel: UInt8, min: UInt8) -> EvoCriteria {
        let levelMin = max(min + method.levelUp, method.level)
        let levelUpRequired = method.levelUp

        return EvoCriteria(species: species, form: form, levelMin: levelMin, levelMax: currentMaxLevel, levelUpRequired: levelUpRequired, method: method.method)
    }

    func getForward(species: Species, form: UInt8) -> ArraySlice<EvolutionMethod> {
        if species.rawValue >= entries.count {
            return []
        } else {
            let methods = entries[species.rawValue]
            return methods.prefix(methods.count)
        }
    }

    func getEvolutions(species: Species, form: UInt8) -> AnyIterator<SpeciesForm> {
        let methods = getForward(species: species, form: form)
        return getEvolutions(evos: methods, form: form)
    }

    func tryEvolve<T>(_ head: T, next: SpeciesForm, pk: PKMProtocol, currentMaxLevel: UInt8, levelMin: UInt8, skipChecks: Bool, tweak: EvolutionRuleTweak) -> (success: Bool, result: EvoCriteria) where T: SpeciesForm {
        var evoMethods = getForward(species: head.species, form: head.form)
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

            return (true, EvolutionForwardSpecies.create(species: next.species, form: next.form, method: method, currentMaxLevel: currentMaxLevel, min: levelMin))
        }

        return (false, EvoCriteria())
    }
}
