//
//  LeadRequired.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/15/24.
//

import Foundation

enum EncounterTriggerCondition: UInt8 {
    case none,
         radar
}

/// Indicates the requirement of the player's lead Pokemon, first sent out when starting an encounter.
/// - remark: Ordered by increasing preference.
enum LeadRequired: UInt8 {
    /// Sentinel value for invalid/impossible to yield lead conditions.
    case Invalid = 0,

         /// `Illuminate` can't fail to apply.
         /// `Suction Cups` failing will fail to yield the encounter, otherwise we'd have no lead required.

         StaticMagnetFail,
         CuteCharmFail,
         SynchronizeFail,

         /// `Ability.Pressure`, `.Hustle`, or `.VitalSpirit`
         PressureHustleSpiritFail,
         IntimidateKeenEyeFail,
         /// `Ability.Illuminate`, `.ArenaTrap`, or `.NoGuard`
         Illuminate,
         /// `Ability.SuctionCups`, or `.StickyHold`
         SuctionCups,
         PressureHustleSpirit,
         /// `Intimidate` succeeding will fail to yield the encounter.
         MagnetPull,
         Static,
         CuteCharm,
         Synchronize,
         /// Higher display priorityies for radar-only encounters.
         CuteCharmRadar,
         SynchronizeRadar,
         Radar,
         /// No lead ability is present, or is not checked for this type of frame.
         None

    func isFailTuple() -> Bool {
        switch self {
        case .PressureHustleSpiritFail, .SynchronizeFail, .CuteCharmFail, .StaticMagnetFail:
            return true

        default: return false
        }
    }

    func getAbility() -> Ability {
        switch self {
        case .Synchronize, .SynchronizeFail, .SynchronizeRadar:
            return .Synchronize
        case .CuteCharm, .CuteCharmFail, .CuteCharmRadar:
            return .CuteCharm
        case .Static, .StaticMagnetFail:
            return .Static
        case .MagnetPull:
            return .MagnetPull
        case .PressureHustleSpirit, .PressureHustleSpiritFail:
            return .Pressure
        case .SuctionCups:
            return .SuctionCups
        case .Illuminate:
            return .Illuminate
        case .IntimidateKeenEyeFail:
            return .Intimidate

        default:
            return .None
        }
    }

    func getDisplayAbility() -> (ability: Ability, isFail: Bool, condition: EncounterTriggerCondition) {
        var isFail = false
        var leadReq = self

        if leadReq.isFailTuple() || leadReq == .IntimidateKeenEyeFail {
            isFail = true
        }

        let condition = switch leadReq {
        case .Radar, .SynchronizeRadar, .CuteCharmRadar:
            EncounterTriggerCondition.radar
        default:
            EncounterTriggerCondition.none
        }

        return (leadReq.getAbility(), isFail, condition)
    }
}
