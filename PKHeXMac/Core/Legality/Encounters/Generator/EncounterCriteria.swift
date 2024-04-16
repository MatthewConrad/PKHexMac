//
//  EncounterCriteria.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/15/24.
//

import Foundation

struct EncounterCriteria: FixedNature, FixedAbilityNumber, ShinyPotential {
    /// Default criteria with no restrictions (ie, random) for all fields
    static let unrestricted = EncounterCriteria()
    
    private static let randomIV: Int = -1
    
    /// End result's gender. Leave as null to not restrict.
    var gender: UInt8?
    
    /// End result's nature; leave as `.Random` to not restrict.
    var nature: Nature = .Random
    
    /// End result's permitted ability numbers. Leave as `.any12H` to not restrict.
    var ability: AbilityPermission = .any12H
    
    /// End results's shininess. Leave as `.random` to not restrict.
    var shiny: Shiny = .random
    
    var ivHP: Int = randomIV
    var ivATK: Int = randomIV
    var ivDEF: Int = randomIV
    var ivSPA: Int = randomIV
    var ivSPD: Int = randomIV
    var ivSPE: Int = randomIV
    
    /// If Encounter yields variable level ranges (eg, RNG corrrelation), force the minimum level instead of yielding first match.
    var forceMinLevelRange: Bool = false
    
    var teraType: MoveType = .AnyMoveType
    
    // unused
    var hpType: Int = -1
    
    /** IV Functions */
    
    func isSpecifiedIVs() -> Bool {
        ![ivHP, ivATK, ivDEF, ivSPA, ivSPD, ivSPE].contains(EncounterCriteria.randomIV)
    }
    
    private func getIVs() -> [Int] {
        [ivHP, ivATK, ivDEF, ivSPE, ivSPA, ivSPD]
    }

    private func getIVsSpeedLast() -> [Int] {
        [ivHP, ivATK, ivDEF, ivSPA, ivSPD, ivSPE]
    }
    
    private func ivCanMatch(requestedIV: Int, encounterIV: Int, generation: UInt8) -> Bool {
        return if requestedIV >= 30 && generation >= 6 {
            // Hyper training possible
            true
        } else {
            encounterIV == EncounterCriteria.randomIV || requestedIV == EncounterCriteria.randomIV || encounterIV == requestedIV
        }
    }
    
    func isCompatibleIVs(_ encounterIVs: [Int]) -> Bool {
        guard encounterIVs.count == 6 else {
            return false
        }
        
        let ivs = getIVs()
        for (index, iv) in ivs.enumerated() {
            if iv != EncounterCriteria.randomIV && iv != encounterIVs[index] {
                return false
            }
        }
        
        return true
    }
    
    /// Checks if the IVs are compatible with the encounter's defined IV restrictions
    func isIVsCompatibleSpeedLast(encounterIVs: [Int], generation: UInt8) -> Bool {
        let ownIVs = getIVsSpeedLast()
        
        for (index, iv) in encounterIVs.enumerated() {
            if !ivCanMatch(requestedIV: ownIVs[index], encounterIV: iv, generation: generation) {
                return false
            }
        }
        
        return true
    }
    
    private func getIVorRandom(iv: Int) -> Int {
        iv != EncounterCriteria.randomIV ? iv : Int.random(in: 0 ..< 32)
    }
    
    private func getIVorRequested(iv: Int8, requested: Int) -> Int {
        return if iv != EncounterCriteria.randomIV {
            Int(iv)
        } else if requested != EncounterCriteria.randomIV {
            requested
        } else {
            Int.random(in: 0 ..< 32)
        }
    }
    
    func setRandomIVs(pk: inout PKMProtocol) {
        pk.ivHP = getIVorRandom(iv: ivHP)
        pk.ivATK = getIVorRandom(iv: ivATK)
        pk.ivDEF = getIVorRandom(iv: ivDEF)
        pk.ivSPA = getIVorRandom(iv: ivSPA)
        pk.ivSPD = getIVorRandom(iv: ivSPD)
        pk.ivSPE = getIVorRandom(iv: ivSPE)
    }
    
    func setRandomIVs(pk: inout PKMProtocol, flawless: inout Int) {
        var ivs = getIVs()
        
        flawless -= ivs.filter { $0 == 31 }.count
        var remaining = ivs.filter { $0 == EncounterCriteria.randomIV }.count
        
        if flawless > remaining {
            // Overwrite specified IVs until we have enough remaining slots
            while flawless > remaining {
                let index = Int.random(in: 0 ..< 6)
                if ![EncounterCriteria.randomIV, 31].contains(ivs[index]) {
                    ivs[index] = EncounterCriteria.randomIV
                    remaining += 1
                }
            }
        }
        
        // Sprinkle in remaining flawless IVs
        while flawless > 0 {
            let index = Int.random(in: 0 ..< 6)
            if ivs[index] == EncounterCriteria.randomIV {
                ivs[index] = 31
                flawless -= 1
            }
        }
        
        // fill in the rest
        for (index, _) in ivs.enumerated() {
            if ivs[index] == EncounterCriteria.randomIV {
                ivs[index] = Int.random(in: 0 ..< 32)
            }
        }
        
        pk.ivs = ivs
    }
    
    func setRandomIVs(pk: inout PKMProtocol, template: IndividualValueSet) {
        guard template.isSpecified else {
            setRandomIVs(pk: &pk)
            return
        }
        
        pk.ivHP = getIVorRequested(iv: template.HP, requested: ivHP)
        pk.ivATK = getIVorRequested(iv: template.ATK, requested: ivATK)
        pk.ivDEF = getIVorRequested(iv: template.DEF, requested: ivDEF)
        pk.ivSPE = getIVorRequested(iv: template.SPE, requested: ivSPE)
        pk.ivSPA = getIVorRequested(iv: template.SPA, requested: ivSPA)
        pk.ivSPD = getIVorRequested(iv: template.SPD, requested: ivSPD)
    }
    
    /** Ability functions */
    
    private static func getAbilityValueDual(ability: Ability, personal: PersonalAbilityDual) -> AbilityPermission {
        return if ability == personal.ability1 {
            ability != personal.ability2 ? .onlyFirst : .any12
        } else {
            ability == personal.ability2 ? .onlySecond : .any12
        }
    }
    
    private static func getAbilityPermissions(ability: Ability, personal: PersonalAbility) -> AbilityPermission {
        let count = personal.abilityCount
        
        guard let personalDual = personal as? PersonalAbilityDual, count >= 2 else {
            return .any12
        }
        
        let dual = getAbilityValueDual(ability: ability, personal: personalDual)
        guard let personalHidden = personal as? PersonalAbilityHidden, count != 2 else {
            return dual
        }
        
        return if ability == personalHidden.abilityH {
            dual == .any12 ? .any12H : .onlyHidden
        } else {
            dual
        }
    }
    
    func getAbilityIndexPreference(canBeHidden: Bool = false) -> Int {
        switch ability {
        case .onlyFirst:
            return 0
        case .onlySecond:
            return 1
        case .onlyHidden where canBeHidden, .any12H where canBeHidden:
            return 2
        default:
            return Int.random(in: 0 ..< 2)
        }
    }
    
    func getAbilityFromNumber(_ num: AbilityPermission) -> Int {
        let (index, isSingle) = num.isSingleValue()
        return if isSingle {
            index
        } else {
            getAbilityIndexPreference(canBeHidden: num.canBeHidden())
        }
    }
    
    /** Gender functions */
    
    private static func getGenderPermissions(requested: UInt8?, detail: GenderDetail) -> UInt8? {
        guard requested! <= 1 else {
            return nil
        }
        
        if detail.dualGender {
            return requested
        }
        
        let fixed = detail.fixedGender()
        return fixed <= 1 ? fixed : nil
    }
    
    /// Indicates if requested gender matches criteria.
    func isGenderSatisfied(requested: UInt8) -> Bool {
        guard gender != nil else {
            return false
        }
        
        return gender == requested
    }
    
    /// Gets the gender to generate, random if unspecified.
    func getGender(detail: GenderDetail) -> UInt8 {
        guard detail.dualGender else {
            return detail.fixedGender()
        }
        
        if detail.genderless {
            return 2
        }
        
        guard let genderNonNil = gender, genderNonNil == 0 || genderNonNil == 1 else {
            return detail.getRandomGender()
        }
        
        return genderNonNil
    }
    
    func getGender(requested: Gender, detail: GenderDetail) -> UInt8 {
        return if requested == .Random {
            getGender(detail: detail)
        } else {
            requested.rawValue
        }
    }
    
    /// Gets the gender to generate, random if unspecified by the template or criteria.
    func getGender(requested: UInt8, detail: GenderDetail) -> UInt8 {
        return if requested < 3 {
            requested
        } else {
            getGender(detail: detail)
        }
    }
    
    /** Criteria functions */
    
    static func getCriteria(template: BattleTemplate, info: PersonalInfo) -> EncounterCriteria {
        EncounterCriteria(
            gender: getGenderPermissions(gender: template.gender, detail: info),
            nature: Nature(fromInt: template.nature.rawValue),
            ability: getAbilityPermissions(ability: template.ability, personal: info),
            shiny: template.shiny ? .always : .never,
            ivHP: template.IVs[0],
            ivATK: template.IVs[1],
            ivDEF: template.IVs[2],
            ivSPA: template.IVs[3],
            ivSPD: template.IVs[4],
            ivSPE: template.IVs[5],
            forceMinLevelRange: false,
            teraType: template.teraType,
            hpType: template.hiddenPowerType)
    }
    
    static func getCriteria(template: BattleTemplate, table: any PersonalTable) -> EncounterCriteria {
        let info = table.getFormEntry(species: template.species, form: template.form)
        
        return getCriteria(template: template, info: info)
    }
    
    /** Nature functions */
    
    /// Gets the nature to generate, random if unspecified.
    func getNature() -> Nature {
        return if nature != .Random {
            nature
        } else {
            Nature(fromInt: Int.random(in: 0 ..< 25))
        }
    }
    
    /// Gets the nature to generate, random if unspecified by the template or criteria.
    func getNature(enclosed: Nature) -> Nature {
        return if enclosed < .Random {
            enclosed
        } else {
            getNature()
        }
    }
}
