//
//  EncounterInvalid.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 5/5/24.
//

import Foundation

/// Invalid Encounter Data
struct EncounterInvalid: Encounterable {
    static let instance = EncounterInvalid()
    
    let species: Species
    let form: Int
    let levelMin: UInt8
    let levelMax: UInt8
    let isEgg: Bool
    
    let generation: UInt8
    let context: EntityContext
    let version: GameVersion
    
    var name: String { "Invalid" }
    var longName: String { "Invalid" }
    
    var isShiny: Bool { false }
    var shiny: Shiny { .never }

    var location: UInt16 { 0 }
    var eggLocation: UInt16 { 0 }
    
    var ability: AbilityPermission { .any12H }

    var fixedBall: Ball { .None }
    
    private init() {
        self.species = .None
        self.form = 0
        self.levelMin = 0
        self.levelMax = 0
        self.isEgg = false
        self.generation = 0
        self.context = .None
        self.version = .InvalidGame
    }
    
    public init(pk: PKMProtocol) {
        self.species = pk.species
        self.form = pk.form
        self.levelMin = pk.metLevel
        self.levelMax = pk.currentLevel
        self.isEgg = pk.wasEgg
        self.generation = pk.generation
        self.version = pk.version
        self.context = pk.context
    }
    
    func convertToPKM(trainer: TrainerInfo) -> PKMProtocol {
        convertToPKM(trainer: trainer, criteria: .unrestricted)
    }
    
    func convertToPKM(trainer: TrainerInfo, criteria: EncounterCriteria) -> PKMProtocol {
        fatalError("Cannot convert an EncounterInvalid to PKM")
    }
}
