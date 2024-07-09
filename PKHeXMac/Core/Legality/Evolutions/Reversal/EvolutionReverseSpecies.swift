//
//  EvolutionReverseSpecies.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/9/24.
//

import Foundation

struct EvolutionReverseSpecies: EvolutionReverse {
    var entries: [[EvolutionMethod]]
    var personal: any PersonalTable

    var lineage: EvolutionLookup {
        EvolutionReverseSpecies.getLineage(t: personal, entries: entries)
    }

    private static func getLineage(t: any PersonalTable, entries: [[EvolutionMethod]]) -> EvolutionReverseLookup {
        var maxSpecies = t.maxSpecies
        var lineage = EvolutionReverseLookup(maxSpecies: maxSpecies)

        for sSpeciesVal in 1 ... maxSpecies.rawValue {
            var formCount = t[sSpeciesVal].formCount

            for sFormVal in 0 ..< formCount {
                let sourceSpecies = Species(intValue: sSpeciesVal)
                let sourceForm = UInt8(sFormVal)

                for evo in entries[sSpeciesVal] {
                    var descSpecies = evo.species

                    if descSpecies == .None {
                        break
                    }

                    var descForm = evo.getDestinationForm(sourceForm: sourceForm)
                    var link = EvolutionLink(method: evo, species: sourceSpecies, form: sourceForm)

                    lineage.register(link: link, species: descSpecies, form: descForm)
                }
            }
        }

        return lineage
    }
}
