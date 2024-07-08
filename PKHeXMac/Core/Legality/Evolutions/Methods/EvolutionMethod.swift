//
//  EvolutionMethod.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/16/24.
//

import Foundation

/// Criteria for evolving to this branch in the `EvolutionTree`
struct EvolutionMethod: SpeciesForm, CustomStringConvertible {
    var species: Species
    var form: UInt8
    var argument: UInt16
    var method: EvolutionType
    var level: UInt8
    var levelUp: UInt8

    /// Is `anyForm` if evolved form isn't modified
    private let anyForm: UInt8 = .max
    private var requiresLevelUp: Bool { levelUp != 0 }

    var description: String {
        "\(species)-\(form) [\(argument)] @ \(level)\(requiresLevelUp ? "X" : "")"
    }

    /// Returns the form that the Pokemon will have after evolution.
    /// - parameters:
    ///     - sourceForm: un-evolved Form ID
    func getDestinationForm(sourceForm: UInt8) -> UInt8 {
        return if form == anyForm {
            sourceForm
        } else {
            form
        }
    }

    private func validNotLevelUp(pk: PKMProtocol, skipChecks: Bool) -> EvolutionCheckResult {
        switch method {
        case .useItemMale, .levelUpRecoilDamageMale:
            return pk.gender == 0 ? .valid : .badGender
        case .useItemFemale, .levelUpRecoilDamageFemale:
            return pk.gender == 1 ? .valid : .badGender
        case .trade, .tradeHeldItem, .tradeShelmetKarrablast:
            return !pk.isUntraded || skipChecks ? .valid : .untraded
        default:
            return .valid
        }
    }

    private func isLevelUpMethodSecondarySatisfied(pk: PKMProtocol, skipChecks: Bool) -> EvolutionCheckResult {
        switch method {
        case .levelUpMale where pk.gender != 0, .levelUpFemale where pk.gender != 1:
            return .badGender
        case .levelUpFormFemale1 where pk.gender != 1:
            return .badGender
        case .levelUpFormFemale1 where pk.form != 1:
            return .badForm

        case .levelUpBeauty:
            guard let contestStats = pk as? ContestStatsReadable else {
                return .valid
            }

            return contestStats.contestBeauty >= argument || skipChecks ? .valid : .lowContestStat

            return .lowContestStat
        case .levelUpNatureAmped, .levelUpNatureLowKey:
            // TODO: finish after ToxtricityUtil
            return .valid

        case .levelUpVersion, .levelUpVersionDay, .levelUpVersionNight:
            guard (pk.version.rawValue & 1) != (argument & 1) && pk.isUntraded else {
                return .valid
            }

            return skipChecks ? .valid : .visitVersion

        case .levelUpKnowMoveEC100, .levelUpInBattleEC100:
            guard pk.encryptionConstant % 100 != 0 else {
                return .valid
            }

            return skipChecks ? .valid : .wrongEC
        case .levelUpKnowMoveECElse, .levelUpInBattleECElse:
            guard pk.encryptionConstant % 100 == 0 else {
                return .valid
            }

            return skipChecks ? .valid : .wrongEC
        default:
            return .valid
        }
    }

    /// Checks the `EvolutionMethod` for validity by comparing against `PKM` data
    func check(pk: PKMProtocol, lvl: UInt8, levelMin: UInt8, skipChecks: Bool, tweak: EvolutionRuleTweak) -> EvolutionCheckResult {
        guard method.isLevelUpRequired() else {
            return validNotLevelUp(pk: pk, skipChecks: skipChecks)
        }

        let secondaryCheck = isLevelUpMethodSecondarySatisfied(pk: pk, skipChecks: skipChecks)
        guard secondaryCheck == .valid else {
            return secondaryCheck
        }

        if lvl < level {
            return .insufficientLEvel
        }

        if !requiresLevelUp {
            return .valid
        }

        if level == 0 && lvl < 2 {
            return .insufficientLEvel
        }

        if lvl < levelMin + levelUp && !skipChecks {
            return lvl == 100 && tweak.allowLevelUpEvolution100 ? .valid : .insufficientLEvel
        }

        return .valid
    }
}
