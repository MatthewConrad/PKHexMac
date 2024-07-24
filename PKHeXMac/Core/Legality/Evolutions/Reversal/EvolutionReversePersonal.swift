//
//  EvolutionReversePersonal.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/9/24.
//

import Foundation

struct EvolutionReversePersonal: EvolutionReverse {
    var entries: [[EvolutionMethod]]
    var personal: any PersonalTable

    var lineage: EvolutionLookup {
        EvolutionReversePersonal.getLineage(t: personal, entries: entries)
    }

    private static func getLineage(t: any PersonalTable, entries: [[EvolutionMethod]]) -> EvolutionReverseLookup {
        let maxSpecies = t.maxSpecies
        var lineage = EvolutionReverseLookup(maxSpecies: maxSpecies)

        for sSpeciesVal in 1 ... maxSpecies.rawValue {
            let formCount = t[sSpeciesVal].formCount

            for sFormVal in 0 ..< formCount {
                let sourceSpecies = Species(intValue: sSpeciesVal)
                let sourceForm = UInt8(sFormVal)
                let index = t.getFormIndex(species: sourceSpecies, form: sourceForm)

                for evo in entries[index] {
                    let descSpecies = evo.species

                    if descSpecies == .None {
                        break
                    }

                    let descForm = evo.getDestinationForm(sourceForm: sourceForm)
                    let link = EvolutionLink(method: evo, species: sourceSpecies, form: sourceForm)

                    lineage.register(link: link, species: descSpecies, form: descForm)
                }
            }
        }

        return lineage
    }
}
