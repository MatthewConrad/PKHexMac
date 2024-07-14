//
//  EvolutionOrigin.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 5/20/24.
//

import Foundation

struct OriginOptions: OptionSet {
    let rawValue: UInt8

    static let none = OriginOptions([])
    static let skipChecks = OriginOptions(rawValue: 1 << 0)
    static let forceDiscard = OriginOptions(rawValue: 1 << 1)

    static let encounterTemplate: OriginOptions = [.skipChecks, .forceDiscard]
}

/// Details about the original encounter.
/// - parameter species: species the encounter originated as
/// - parameter version: version the encounter originated in
/// - parameter generation: generation the encounter originated in
/// - parameter levelMin: minimum level the encounter originated at
/// - parameter levelMax: maximum level in final state
/// - parameter options: options to toggle logic when using this data
struct EvolutionOrigin {
    let species: Species
    let version: GameVersion
    let generation: UInt8
    let levelMin: UInt8
    let levelMax: UInt8
    let options: OriginOptions

    init(species: Species, version: GameVersion, generation: UInt8, levelMin: UInt8, levelMax: UInt8, options: OriginOptions = .none) {
        self.species = species
        self.version = version
        self.generation = generation
        self.levelMin = levelMin
        self.levelMax = levelMax
        self.options = options
    }

    /// Checks if evolution checks against the Entity should be skipped when evolving or devolving.
    var skipChecks: Bool {
        self.options.contains(.skipChecks)
    }

    /// Internally used to enforce Gen1 origin encs NOT jumpting to Gen2 to continue devolving
    func isDiscardRequired(format: UInt8) -> Bool {
        format <= 2 && self.options.contains(.forceDiscard)
    }
}
