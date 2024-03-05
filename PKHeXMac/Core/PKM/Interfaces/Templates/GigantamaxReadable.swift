//
//  GigantamaxReadable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

protocol GigantamaxReadable {
    var canGigantamax: Bool { get }
}

// TODO: relocate me!!
enum Gigantamax {
    static func canToggle(species: Species) -> Bool {
        [
            .Venusaur, .Charizard, .Blastoise, .Butterfree, .Pikachu,
            .Meowth, .Machamp, .Gengar, .Kingler, .Lapras, .Eevee,
            .Snorlax, .Garbodor,

            .Corviknight, .Orbeetle, .Drednaw, .Coalossal, .Flapple,
            .Appletun, .Sandaconda, .Toxtricity, .Centiskorch, .Hatterene,
            .Grimmsnarl, .Alcremie, .Copperajah, .Duraludon,

            .Rillaboom, .Cinderace, .Inteleon, .Urshifu // DLC1
        ].contains(species)
    }

    static func canToggle(species: Species, form: UInt8) -> Bool {
        return if [.Pikachu, .Meowth].contains(species) {
            form == 0
        } else {
            canToggle(species: species)
        }
    }

    static func canToggle(currentSpecies: Species, currentForm: UInt8, originalSpecies: Species) -> Bool {
        canToggle(species: currentSpecies, form: currentForm) ||
            currentSpecies != originalSpecies && canToggle(species: originalSpecies)
    }
}
