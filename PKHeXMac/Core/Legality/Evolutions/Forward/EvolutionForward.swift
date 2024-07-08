//
//  EvolutionForward.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/6/24.
//

import Foundation

protocol EvolutionForward {
    /// Gets the forward evolution paths for the given species and form.
    func getForward(species: Species, form: UInt8) -> ArraySlice<EvolutionMethod>

    /// Gets all the species the `species` /`form` can evolve into, yielded in increasing order of evo stage.
    /// - returns sequence of species IDs (with the Form IDs included, left-shifted by 11)
    func getEvolutions(species: Species, form: UInt8) -> AnyIterator<SpeciesForm>

    /// Tries to evolve the given `pk` to the next evolution stage.
    func tryEvolve<T: SpeciesForm>(_ head: T, next: SpeciesForm, pk: PKMProtocol, currentMaxLevel: UInt8, levelMin: UInt8, skipChecks: Bool, tweak: EvolutionRuleTweak) -> (success: Bool, result: EvoCriteria)
}

extension EvolutionForward {
    func getEvolutions(evos: ArraySlice<EvolutionMethod>, form: UInt8) -> AnyIterator<SpeciesForm> {
        var index = 0
        var hasReturnedRoot = false

        return AnyIterator {
            guard index < evos.count else { return nil }

            let method = evos[index]
            let s = method.species
            if s == .None {
                index += 1
                return nil
            }

            let f = method.getDestinationForm(sourceForm: form)
            index += 1

            if hasReturnedRoot {
                for nextEvo in getEvolutions(species: s, form: f) {
                    return nextEvo
                }
                return nil
            } else {
                hasReturnedRoot = true
                return DefaultSpeciesForm(species: s, form: f)
            }
        }
    }
}
