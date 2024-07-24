//
//  EncounterEgg.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 5/5/24.
//

import Foundation

struct EncounterEgg: Encounterable {
    let species: Species
    let form: UInt8
    let level: UInt8

    let generation: UInt8
    let context: EntityContext
    let version: GameVersion

    var name: String { "Egg" }
    var longName: String { "Egg" }

    var isEgg: Bool { true }

    var levelMin: UInt8 { self.level }
    var levelMax: UInt8 { self.level }

    var isShiny: Bool { false }
    var shiny: Shiny { .random }

    var location: UInt16 { 0 }
    var eggLocation: UInt16 {
        UInt16(Locations.GetDaycareLocation(generation: Int(self.generation), version: self.version))
    }

    var ability: AbilityPermission { .any12H }

    var fixedBall: Ball { self.generation <= 5 ? .Poke : .None }

    var canHaveVoltTackle: Bool {
        self.species == .Pichu && (self.generation > 3 || self.version == .E)
    }

    private func setForm(pk: inout PKMProtocol, sav: TrainerInfo) {
        switch self.species {
        case .Minior:
            pk.form = UInt8.random(in: 7 ..< 14)
            return
        case .Scatterbug, .Spewpa, .Vivillon:
            if sav.generation == 6 || sav.generation == 7 {
                guard let savOrigin = sav as? RegionOrigin else {
                    return
                }

                pk.form = Vivillon3DS.getPattern(country: savOrigin.country, region: savOrigin.region)
            }
            return

        default:
            return
        }
    }

    private func setPINGA(pk: inout PKMProtocol, criteria: EncounterCriteria) {
        criteria.setRandomIVs(pk: &pk)

        guard pk.format > 2 else {
            return
        }

        let gender = criteria.getGender(detail: pk.personalInfo)
        let nature = criteria.getNature()

        if pk.format <= 5 {
            pk.setPIDGender(gender)
            pk.setPIDNature(nature)
            pk.nature = nature
            pk.gender = gender
            pk.refreshAbility(pk.PIDAbility)
        } else {
            pk.PID = UInt(RandUtil.rand32())
            pk.nature = nature
            pk.statNature = nature
            pk.gender = gender
            pk.refreshAbility(Int.random(in: 0 ..< 2))
        }
    }

    private func setMetData(pk: inout PKMProtocol) {
        // TODO: finish once have EggStateLegality

        guard var pkObedience = pk as? ObedienceLevelable else {
            return
        }

        pkObedience.obedienceLevel = pk.metLevel
    }
    
    private func setEncounterMoves(pk: inout PKMProtocol, version: GameVersion) {
        // TODO: finish me after learnsource stuff
        pk.setMoves(moves: [.None, .None,.None,.None])
    }

    func convertToPKM(trainer: TrainerInfo) -> PKMProtocol {
        self.convertToPKM(trainer: trainer, criteria: .unrestricted)
    }

    func convertToPKM(trainer: TrainerInfo, criteria: EncounterCriteria) -> PKMProtocol {
        // TODO: finish after more PKM-related work
        fatalError("not implemented!")
    }
}
