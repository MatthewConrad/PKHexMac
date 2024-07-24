//
//  EvolutionType.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/16/24.
//

import Foundation

/// Describes how an evolution can be triggered.
/// - remark: This ordering matches the mainline enum
enum EvolutionType: UInt8 {
    case none = 0,
         levelUpFriendship = 1,
         levelUpFriendshipMorning = 2,
         levelUpFriendshipNight = 3,
         levelUp = 4,
         trade = 5,
         tradeHeldItem = 6,
         tradeShelmetKarrablast = 7,
         useItem = 8,
         levelUpATK = 9,
         levelUpAeqD = 10,
         levelUpDEF = 11,
         levelUpECl5 = 12,
         levelUpECgeq5 = 13,
         levelUpNinjask = 14,
         levelUpShedinja = 15,
         levelUpBeauty = 16,
         useItemMale = 17,
         useItemFemale = 18,
         levelUpHeldItemDay = 19,
         levelUpHeldItemNight = 20,
         levelUpKnowMove = 21,
         levelUpWithTeammate = 22,
         levelUpMale = 23,
         levelUpFemale = 24,
         levelUpElectric = 25,
         levelUpForest = 26,
         levelUpCold = 27,
         levelUpInverted = 28,
         levelUpAffection50MoveType = 29,
         levelUpMoveType = 30,
         levelUpWeather = 31,
         levelUpMorning = 32,
         levelUpNight = 33,
         levelUpFormFemale1 = 34,
         UNUSED = 35,
         levelUpVersion = 36,
         levelUpVersionDay = 37,
         levelUpVersionNight = 38,
         levelUpSummit = 39,
         levelUpDusk = 40,
         levelUpWormhole = 41,
         useItemWormhole = 42,
         criticalHitsInBattle = 43, // Sirfetch'd
         hitPointsLostInBattle = 44, // Runerigus
         spin = 45, // Alcremie
         levelUpNatureAmped = 46, // Toxtricity
         levelUpNatureLowKey = 47, // Toxtricity
         towerOfDarkness = 48, // Urshifu
         towerOfWaters = 49, // Urshifu

         levelUpWalkStepsWith = 50,
         levelUpUnionCircle = 51, // Palafin
         levelUpInBattleEC100 = 52, // Maushold-0
         levelUpInBattleECElse = 53, // Maushold-1
         levelUpCollect999 = 54, // Gimmighoul formarg 999
         levelUpDefeatEquals = 55, // Kingambit
         levelUpUseMoveSpecial = 56, // Annihilape
         levelUpKnowMoveECElse = 57, // Dudunsparce-0
         levelUpKnowMoveEC100 = 58, // Dudunsparce-1

         levelUpRecoilDamageMale = 59, // Basculegion-0
         levelUpRecoilDamageFemale = 60, // Basculegion-1

         hisui = 61,

         // These are fake IDs as PLA indexes clashed with mainline.
         useItemFullMoon = 90, // Ursaluna
         useMoveAgileStyle = 91, // Wyrdeer
         useMoveStrongStyle = 92, // Overqwil

         // Used as placeholder for internal logic
         // originally unchecked((byte)-1), but that ultimately overflows to 255
         invalid = 255

    func isTrade() -> Bool {
        [.trade, .tradeHeldItem, .tradeShelmetKarrablast].contains(self)
    }

    func isLevelUpRequired() -> Bool {
        switch self {
        case .none, .UNUSED:
            return false
        case .levelUpFriendship, .levelUpFriendshipMorning, .levelUpFriendshipNight,
             .levelUp, .levelUpATK, .levelUpAeqD, .levelUpDEF, .levelUpECl5, .levelUpECgeq5,
             .levelUpNinjask, .levelUpShedinja, .levelUpBeauty,
             .levelUpHeldItemDay, .levelUpHeldItemNight,
             .levelUpKnowMove, .levelUpWithTeammate, .levelUpMale, .levelUpFemale,
             .levelUpElectric, .levelUpForest, .levelUpCold, .levelUpInverted,
             .levelUpAffection50MoveType, .levelUpMoveType,
             .levelUpWeather, .levelUpMorning, .levelUpNight,
             .levelUpFormFemale1, .levelUpVersion, .levelUpVersionDay, .levelUpVersionNight,
             .levelUpSummit, .levelUpDusk, .levelUpWormhole,
             .levelUpNatureAmped, .levelUpNatureLowKey, .levelUpWalkStepsWith,
             .levelUpUnionCircle, .levelUpInBattleEC100, .levelUpInBattleECElse,
             .levelUpCollect999, .levelUpDefeatEquals,
             .levelUpUseMoveSpecial, .levelUpKnowMoveECElse, .levelUpKnowMoveEC100,
             .levelUpRecoilDamageMale, .levelUpRecoilDamageFemale:
            return true
        case .trade, .tradeHeldItem, .tradeShelmetKarrablast,
             .useItem, .useItemMale, .useItemFemale, .useItemWormhole,
             .criticalHitsInBattle, .hitPointsLostInBattle, .spin,
             .towerOfDarkness, .towerOfWaters,
             .hisui, .useItemFullMoon, .useMoveAgileStyle, .useMoveStrongStyle:
            return false
        default: fatalError("Evolution Type is invalid")
        }
    }
}
