//
//  EvoCriteria.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/16/24.
//

import Foundation

/// Evolution Info tracking how an evolution was performed, as well as the end result species and form
struct EvoCriteria: SpeciesForm, LevelRange, CustomStringConvertible {
    var species: Species
    var form: UInt8

    var levelMin: UInt8
    var levelMax: UInt8
    var levelUpRequired: UInt8

    var method: EvolutionType

    var requiresLevelUp: Bool { levelUpRequired != 0 }
    static var sentinelNotReached: EvolutionType { .invalid }

    var description: String {
        "\(species)\(form != 0 ? "-\(form)" : "") [\(levelMin), \(levelMax)] via \(method)"
    }

    init() {
        species = .None
        form = 0
        levelMin = 1
        levelMax = 100
        levelUpRequired = 100
        method = .invalid
    }

    init(species: Species, form: UInt8, levelMin: UInt8, levelMax: UInt8, levelUpRequired: UInt8, method: EvolutionType) {
        self.species = species
        self.form = form
        self.levelMin = levelMin
        self.levelMax = levelMax
        self.levelUpRequired = levelUpRequired
        self.method = method
    }

    func isBetterDevolution(reference: EvoCriteria) -> Bool {
        guard reference.species != .None else {
            return true
        }

        return levelMin + levelUpRequired < reference.levelMin + reference.levelUpRequired
    }

    func isBetterEvolution(reference: EvoCriteria) -> Bool {
        guard reference.method != EvoCriteria.sentinelNotReached else {
            return true
        }

        guard levelMin + levelUpRequired <= reference.levelMin + reference.levelUpRequired else {
            return false
        }

        return levelMax > reference.levelMax
    }
}
