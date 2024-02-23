//
//  Core.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/6/24.
//

import Foundation

enum Legal {
    static var MaxSpeciesID_1 = Species.Mew
    static var MaxMoveID_1 = 165
    static var MaxItemID_1 = 255
    static var MaxAbilityID_1 = 0

    static var MaxSpeciesID_2 = Species.Celebi
    static var MaxMoveID_2 = 251
    static var MaxItemID_2 = 255
    static var MaxAbilityID_2 = 0

    static var MaxSpeciesID_3 = Species.Deoxys
    static var MaxMoveID_3 = 354
    static var MaxItemID_3 = 374
    static var MaxItemID_3_E = 376
    static var MaxItemID_3_COLO = 547
    static var MaxItemID_3_XD = 593
    static var MaxAbilityID_3 = 77
    static var MaxBallID_3 = 0xc
    static var MaxGameID_3 = 15 // CXD

    static var MaxSpeciesID_4 = Species.Arceus
    static var MaxMoveID_4 = 467
    static var MaxItemID_4_DP = 464
    static var MaxItemID_4_Pt = 467
    static var MaxItemID_4_HGSS = 536
    static var MaxAbilityID_4 = 123
    static var MaxBallID_4 = 0x18
    static var MaxGameID_4 = 15 // CXD

    static var MaxSpeciesID_5 = Species.Genesect
    static var MaxMoveID_5 = 559
    static var MaxItemID_5_BW = 632
    static var MaxItemID_5_B2W2 = 638
    static var MaxAbilityID_5 = 164
    static var MaxBallID_5 = 0x19
    static var MaxGameID_5 = 23 // B2

    static var MaxSpeciesID_6 = Species.Volcanion
    static var MaxMoveID_6_XY = 617
    static var MaxMoveID_6_AO = 621
    static var MaxItemID_6_XY = 717
    static var MaxItemID_6_AO = 775
    static var MaxAbilityID_6_XY = 188
    static var MaxAbilityID_6_AO = 191
    static var MaxBallID_6 = 0x19
    static var MaxGameID_6 = 27 // OR

    static var MaxSpeciesID_7 = Species.Marshadow
    static var MaxMoveID_7 = 719
    static var MaxItemID_7 = 920
    static var MaxAbilityID_7 = 232
    static var MaxBallID_7 = 0x1a // 26
    static var MaxGameID_7 = 41 // Crystal (VC?)

    static var MaxSpeciesID_7_USUM = Species.Zeraora
    static var MaxMoveID_7_USUM = 728
    static var MaxItemID_7_USUM = 959
    static var MaxAbilityID_7_USUM = 233

    static var MaxSpeciesID_7b = Species.Melmetal // Melmetal
    static var MaxMoveID_7b = 742 // Double Iron Bash
    static var MaxItemID_7b = 1057 // Magmar Candy
    static var MaxBallID_7b = Ball.Beast
    static var MaxGameID_7b = GameVersion.GE
    static var MaxAbilityID_7b = 233

    // Orion (No DLC)
    static var MaxSpeciesID_8_O0 = Species.Eternatus
    static var MaxMoveID_8_O0 = 796 // Steel Beam
    static var MaxItemID_8_O0 = 1278 // Rotom Catalog, ignore all catalog parts
    static var MaxAbilityID_8_O0 = 258 // Hunger Switch

    // Rigel 1 (DLC 1: Isle of Armor)
    static var MaxSpeciesID_8_R1 = Species.Zarude
    static var MaxMoveID_8_R1 = 818 // Surging Strikes
    static var MaxItemID_8_R1 = 1589 // Mark Charm
    static var MaxAbilityID_8_R1 = 260 // Unseen Fist

    // Rigel 2 (DLC 2: Crown Tundra)
    static var MaxSpeciesID_8_R2 = Species.Calyrex // Calyrex
    static var MaxMoveID_8_R2 = 826 // Eerie Spell
    static var MaxItemID_8_R2 = 1607 // Reins of Unity
    static var MaxAbilityID_8_R2 = 267 // As One (Glastrier)

    // Current Binaries
    static var MaxSpeciesID_8 = Species.Calyrex
    static var MaxMoveID_8: Int {
        return MaxMoveID_8_R2
    }

    static var MaxItemID_8: Int {
        return MaxItemID_8_R2
    }

    static var MaxAbilityID_8: Int {
        return MaxAbilityID_8_R2
    }

    static var MaxBallID_8 = Ball.Beast // 26 Beast
    static var MaxGameID_8 = GameVersion.SH // Shield

    static var MaxSpeciesID_8a = Species.Enamorus
    static var MaxMoveID_8a = Move.TakeHeart
    static var MaxItemID_8a = 1828 // Legend Plate
    static var MaxBallID_8a = Ball.LAOrigin
    // static var  MaxGameID_8a = GameVersion.SP
    static var MaxAbilityID_8a: Int {
        return MaxAbilityID_8_R2
    }

    static var MaxSpeciesID_8b = Species.Arceus
    static var MaxMoveID_8b: Int {
        return MaxMoveID_8_R2
    }

    static var MaxItemID_8b = 1822 // DS Sounds
    static var MaxBallID_8b = Ball.LAOrigin
    // static var  MaxGameID_8b = GameVersion.SP
    static var MaxAbilityID_8b: Int {
        return MaxAbilityID_8_R2
    }

    static var MaxSpeciesID_9_T0 = Species.IronLeaves
    static var MaxMoveID_9_T0 = Move.MagicalTorque
    static var MaxItemID_9_T0 = 2400 // Yellow Dish
    static var MaxAbilityID_9_T0 = Ability.MyceliumMight

    static var MaxSpeciesID_9_T1 = Species.Ogerpon
    static var MaxMoveID_9_T1 = Move.IvyCudgel
    static var MaxItemID_9_T1 = 2481 // Glimmering Charm
    static var MaxAbilityID_9_T1 = Ability.SupersweetSyrup

    static var MaxSpeciesID_9_T2 = Species.Pecharunt
    static var MaxMoveID_9_T2 = Move.MalignantChain
    static var MaxItemID_9_T2 = 2557 // Briar’s Book
    static var MaxAbilityID_9_T2 = Ability.PoisonPuppeteer

    static var MaxBallID_9 = Ball.LAOrigin
    static var MaxGameID_9 = GameVersion.VL

    static var MaxSpeciesID_9 = Species.Pecharunt
    static var MaxMoveID_9: Move {
        return MaxMoveID_9_T2
    }

    static var MaxItemID_9: Int {
        return MaxItemID_9_T2
    }

    static var MaxAbilityID_9: Ability {
        return MaxAbilityID_9_T2
    }

    static var MaxGameID_HOME: GameVersion {
        return MaxGameID_9
    }

    /// Gets the max `LanguageID` for a generation.
    /// - returns: A maximum valid `LanguageID`
    static func getMaxLanguageID(generation: Int) -> LanguageID {
        switch generation {
        case 1, 3:
            return LanguageID.Spanish
        case 2, 4, 5, 6:
            return LanguageID.Korean
        case 7, 8, 9:
            return LanguageID.ChineseT
        default:
            return LanguageID.Hacked
        }
    }

    /// Indicates if PP Up can be used on a move
    /// - returns: `true` if PP Up can be used on a move
    static func isPPUpAvailable(move: Move) -> Bool {
        switch move {
        case Move.None, Move.Sketch, Move.RevivalBlessing:
            return false
        default:
            return true
        }
    }

    /// Gets the maximum length of a Trainer Name for a given generation and language.
    /// - parameters:
    ///   - generation: the generation ID
    ///   - language: the LanguageID
    /// - returns: the maximum length of a Trainer Name
    static func getMaxLengthOT(generation: Int, language: LanguageID) -> Int {
        switch language {
        case LanguageID.ChineseS, LanguageID.ChineseT:
            return 6
        case LanguageID.Japanese, LanguageID.Korean:
            return generation >= 6 ? 6 : 5
        default:
            return generation >= 6 ? 12 : 7
        }
    }

    /// Gets the maximum length of a Nickname  for a given generation and language.
    /// - parameters:
    ///   - generation: the generation ID
    ///   - language: the LanguageID
    /// - returns: the maximum length of a Nickname
    static func getMaxLengthNickname(generation: Int, language: LanguageID) -> Int {
        switch language {
        case LanguageID.ChineseS, LanguageID.ChineseT:
            return 6
        case LanguageID.Japanese, LanguageID.Korean:
            return generation >= 6 ? 6 : 5
        default:
            return generation >= 6 ? 12 : 10
        }
    }

    static func getisFixedIVSequenceValidSkipRand1() {
        // TODO: implement me
    }

    static func getisFixedIVSequenceValidSkipRand2() {
        // TODO: implement me
    }

    static func getisFixedIVSequenceValidSkipNoRand() {
        // TODO: implement me
    }
}
