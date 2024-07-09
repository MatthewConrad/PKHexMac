//
//  EvolutionLink.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/8/24.
//

import Foundation

/// Links an `EvolutionMethod` to the source `Species` and `form` that the method can be triggered from.
/// - remark: this needs to be a class so it gets passed by reference!
class EvolutionLink: SpeciesForm {
    var method: EvolutionMethod
    var species: Species
    var form: UInt8

    var isEmpty: Bool {
        species == .None
    }

    init() {
        method = EvolutionMethod()
        species = .None
        form = 0
    }

    init(method: EvolutionMethod, species: Species, form: UInt8) {
        self.method = method
        self.species = species
        self.form = form
    }
}
