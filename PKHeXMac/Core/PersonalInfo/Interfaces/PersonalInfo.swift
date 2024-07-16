//
//  PersonalInfo.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

protocol PersonalInfo: BaseStat, EffortValueYield, GenderDetail, PersonalFormInfo, PersonalAbility, PersonalEgg, PersonalEncounter, PersonalType, PersonalMisc {
    /// Writes entry to raw bytes
    func write() -> [UInt8]

    var gender: UInt8 { get set }
    var expGrowth: UInt8 { get set }
}

/// Originally implemented as `abstract class PersonalInfo`
extension PersonalInfo {
    var ratioMagicGenderless: UInt8 { 255 }
    var ratioMagicFemale: UInt8 { 254 }
    var ratioMagicMale: UInt8 { 0 }

    var dualGender: Bool { self.gender - 1 < 253 }
    var genderless: Bool { self.gender == self.ratioMagicGenderless }
    var onlyFemale: Bool { self.gender == self.ratioMagicFemale }
    var onlyMale: Bool { self.gender == self.ratioMagicMale }

    var formCount: Int { get { 1 } set {} }
    var hasForms: Bool { self.formCount > 1 }

    func hasForm(form: Int) -> Bool {
        return if form == 0 || form >= self.formCount {
            false
        } else if self.formStatsIndex <= 0 {
            false
        } else {
            true
        }
    }

    func formIndex(species: Species, form: Int) -> Int {
        return if !self.hasForm(form: form) {
            species.rawValue
        } else {
            self.formStatsIndex + form - 1
        }
    }

    func isFormWithinRange(form: Int) -> Bool {
        return if form == 0 {
            true
        } else {
            form < self.formCount
        }
    }

    func isSingleGender(gt: Int) -> Bool {
        gt - 1 >= 253
    }

    /// Gets the span of values for a given Gender
    func getGenderMinMax(gender: UInt8, ratio: UInt8) -> ClosedRange<UInt8> {
        switch ratio {
        case self.ratioMagicMale, self.ratioMagicFemale, self.ratioMagicGenderless:
            return 0 ... 255
        default:
            switch gender {
            case 0:
                return ratio ... 255
            case 1:
                return 0 ... (ratio - 1)
            default:
                return 0 ... 255
            }
        }
    }
}
