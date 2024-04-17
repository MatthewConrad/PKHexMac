//
//  EncounterMatch.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/16/24.
//

import Foundation

/// Exposes details about quality of a potential match compared to an input `PKM`
/// - remark: formerly `IEncounterMatch`
protocol EncounterMatch {
    /// Checks if the implementing object's details might have been the orignator of the current `PKM` data.
    func isMatchExact(pk: PKMProtocol, evo: EvoCriteria) -> Bool

    /// Checks if the potential match may not be perfect (might be a better match later during iteration).
    func getMatchRating(pk: PKMProtocol) -> EncounterMatchRating
}

extension EncounterMatch {
    private func isPartialMatchHidden(species: Species) -> Bool {
        [
            .Metapod, .Kakuna,
            .Pupitar,
            .Silcoon, .Cascoon,
            .Vibrava, .Flygon,
        ].contains(species)
    }

    /// Some species don't have a Hidden Ability, but can be altered to have the HA slot via pre-evo.
    func isPartialMatchHidden(current: Species, original: Species) -> Bool {
        return if current == original {
            false
        } else if !self.isPartialMatchHidden(species: original) {
            false
        } else {
            self.isPartialMatchHidden(species: current)
        }
    }
}
