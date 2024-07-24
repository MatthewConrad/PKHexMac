//
//  EvolutionNetwork.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/14/24.
//

import Foundation

/// Exposes abstractions for reverse and forward evolution lookups.
protocol EvolutionNetwork {
    /// Provides interactions to look forward in an evolution tree.
    var forward: EvolutionForward { get }
    /// Provides interactions to look backward in an evolution tree.
    var reverse: EvolutionReverse { get }
}

extension EvolutionNetwork {
    /// Gets all species the `species`-`form` can evolve to and from, in order of evo stage
    func getEvolutionsAndPreEvolutions(species: Species, form: UInt8) -> AnyIterator<SpeciesForm> {
        let hasReturnedSelf = false

        return AnyIterator {
            for preEvo in reverse.getPreEvolutions(species: species, form: form) {
                return preEvo
            }

            if !hasReturnedSelf {
                return DefaultSpeciesForm(species: species, form: form)
            } else {
                for evo in forward.getEvolutions(species: species, form: form) {
                    return evo
                }
            }
            
            return nil
        }
    }

    /// Checks if the requested `species`-`form` has any common evolutions with `otherSpecies`-`otherForm`
    func isSpeciesDerivedFrom(species: Species, form: UInt8, otherSpecies: Species, otherForm: UInt8, ignoreForm: Bool = true) -> Bool {
        let evos = getEvolutionsAndPreEvolutions(species: species, form: form)

        for evo in evos {
            if evo.species != otherSpecies {
                continue
            }
            if ignoreForm {
                return true
            }

            return evo.form == otherForm
        }

        return false
    }

    /// Gets the base (baby) species and form of the given `species`-`form` pair.
    func getBaseSpeciesForm(species: Species, form: UInt8) -> SpeciesForm {
        let chain = reverse.getPreEvolutions(species: species, form: form)

        for evo in chain {
            return evo
        }

        return DefaultSpeciesForm(species: species, form: form)
    }
}
