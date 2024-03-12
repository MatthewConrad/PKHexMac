//
//  Core.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/6/24.
//

import Foundation

enum Legal {
    static let MaxSpeciesID_1 = Species.Mew
    static let MaxMoveID_1 = Move.Struggle
    static let MaxItemID_1 = 255
    static let MaxAbilityID_1 = Ability.None

    static let MaxSpeciesID_2 = Species.Celebi
    static let MaxMoveID_2 = Move.BeatUp
    static let MaxItemID_2 = 255
    static let MaxAbilityID_2 = Ability.None

    static let MaxSpeciesID_3 = Species.Deoxys
    static let MaxMoveID_3 = Move.PsychoBoost
    static let MaxItemID_3 = 374
    static let MaxItemID_3_E = 376
    static let MaxItemID_3_COLO = 547
    static let MaxItemID_3_XD = 593
    static let MaxAbilityID_3 = Ability.AirLock
    static let MaxBallID_3 = Ball.Premier
    static let MaxGameID_3 = GameVersion.CXD

    static let MaxSpeciesID_4 = Species.Arceus
    static let MaxMoveID_4 = Move.ShadowForce
    static let MaxItemID_4_DP = 464
    static let MaxItemID_4_Pt = 467
    static let MaxItemID_4_HGSS = 536
    static let MaxAbilityID_4 = Ability.BadDreams
    static let MaxBallID_4 = Ball.Sport
    static let MaxGameID_4 = GameVersion.CXD

    static let MaxSpeciesID_5 = Species.Genesect
    static let MaxMoveID_5 = Move.FusionBolt
    static let MaxItemID_5_BW = 632
    static let MaxItemID_5_B2W2 = 638
    static let MaxAbilityID_5 = Ability.Teravolt
    static let MaxBallID_5 = Ball.Dream
    static let MaxGameID_5 = GameVersion.B2

    static let MaxSpeciesID_6 = Species.Volcanion
    static let MaxMoveID_6_XY = Move.LightOfRuin
    static let MaxMoveID_6_AO = Move.HyperspaceFury
    static let MaxItemID_6_XY = 717
    static let MaxItemID_6_AO = 775
    static let MaxAbilityID_6_XY = Ability.AuraBreak
    static let MaxAbilityID_6_AO = Ability.DeltaStream
    static let MaxBallID_6 = Ball.Dream
    static let MaxGameID_6 = GameVersion.OR

    static let MaxSpeciesID_7 = Species.Marshadow
    static let MaxMoveID_7 = Move.TenMVoltThunderbolt
    static let MaxItemID_7 = 920
    static let MaxAbilityID_7 = Ability.PrismArmor
    static let MaxBallID_7 = Ball.Beast
    static let MaxGameID_7 = GameVersion.C

    static let MaxSpeciesID_7_USUM = Species.Zeraora
    static let MaxMoveID_7_USUM = Move.ClangorousSoulblaze
    static let MaxItemID_7_USUM = 959
    static let MaxAbilityID_7_USUM = Ability.Neuroforce

    static let MaxSpeciesID_7b = Species.Melmetal
    static let MaxMoveID_7b = Move.DoubleIronBash
    static let MaxItemID_7b = 1057 // Magmar Candy
    static let MaxBallID_7b = Ball.Beast
    static let MaxGameID_7b = GameVersion.GE
    static let MaxAbilityID_7b = Ability.Neuroforce

    // Orion (No DLC)
    static let MaxSpeciesID_8_O0 = Species.Eternatus
    static let MaxMoveID_8_O0 = Move.SteelBeam
    static let MaxItemID_8_O0 = 1278 // Rotom Catalog, ignore all catalog parts
    static let MaxAbilityID_8_O0 = Ability.HungerSwitch

    // Rigel 1 (DLC 1: Isle of Armor)
    static let MaxSpeciesID_8_R1 = Species.Zarude
    static let MaxMoveID_8_R1 = Move.SurgingStrikes
    static let MaxItemID_8_R1 = 1589 // Mark Charm
    static let MaxAbilityID_8_R1 = Ability.UnseenFist

    // Rigel 2 (DLC 2: Crown Tundra)
    static let MaxSpeciesID_8_R2 = Species.Calyrex
    static let MaxMoveID_8_R2 = Move.EerieSpell
    static let MaxItemID_8_R2 = 1607 // Reins of Unity
    static let MaxAbilityID_8_R2 = Ability.AsOneG

    // Current Binaries
    static let MaxSpeciesID_8 = Species.Calyrex
    static let MaxMoveID_8: Move = MaxMoveID_8_R2

    static let MaxItemID_8: Int = MaxItemID_8_R2

    static let MaxAbilityID_8: Ability = MaxAbilityID_8_R2

    static let MaxBallID_8 = Ball.Beast // 26 Beast
    static let MaxGameID_8 = GameVersion.SH // Shield

    static let MaxSpeciesID_8a = Species.Enamorus
    static let MaxMoveID_8a = Move.TakeHeart
    static let MaxItemID_8a = 1828 // Legend Plate
    static let MaxBallID_8a = Ball.LAOrigin
    // static let  MaxGameID_8a = GameVersion.SP
    static let MaxAbilityID_8a: Ability = MaxAbilityID_8_R2

    static let MaxSpeciesID_8b = Species.Arceus
    static let MaxMoveID_8b: Move = MaxMoveID_8_R2

    static let MaxItemID_8b = 1822 // DS Sounds
    static let MaxBallID_8b = Ball.LAOrigin
    // static let  MaxGameID_8b = GameVersion.SP
    static let MaxAbilityID_8b: Ability = MaxAbilityID_8_R2

    static let MaxSpeciesID_9_T0 = Species.IronLeaves
    static let MaxMoveID_9_T0 = Move.MagicalTorque
    static let MaxItemID_9_T0 = 2400 // Yellow Dish
    static let MaxAbilityID_9_T0 = Ability.MyceliumMight

    static let MaxSpeciesID_9_T1 = Species.Ogerpon
    static let MaxMoveID_9_T1 = Move.IvyCudgel
    static let MaxItemID_9_T1 = 2481 // Glimmering Charm
    static let MaxAbilityID_9_T1 = Ability.SupersweetSyrup

    static let MaxSpeciesID_9_T2 = Species.Pecharunt
    static let MaxMoveID_9_T2 = Move.MalignantChain
    static let MaxItemID_9_T2 = 2557 // Briar’s Book
    static let MaxAbilityID_9_T2 = Ability.PoisonPuppeteer

    static let MaxBallID_9 = Ball.LAOrigin
    static let MaxGameID_9 = GameVersion.VL

    static let MaxSpeciesID_9 = Species.Pecharunt
    static let MaxMoveID_9: Move = MaxMoveID_9_T2

    static let MaxItemID_9: Int = MaxItemID_9_T2

    static let MaxAbilityID_9: Ability = MaxAbilityID_9_T2

    static let MaxGameID_HOME: GameVersion = MaxGameID_9

    static let heldItemsGSC: [UInt16] = ItemStorage2.allHeldItems
    static let heldItemsRS: [UInt16] = ItemStorage3.allHeldItems
    static let heldItemsDP: [UInt16] = ItemStorage4.allHeldItems
    static let heldItemsPt: [UInt16] = ItemStorage4.allHeldItemsPt
    static let heldItemsHGSS: [UInt16] = heldItemsPt
    static let heldItemsBW: [UInt16] = ItemStorage5.allHeldItems
    static let heldItemsXY: [UInt16] = ItemStorage6.allHeldItemsXY
    static let heldItemsAO: [UInt16] = ItemStorage6.allHeldItemsORAS
    static let heldItemsSM: [UInt16] = ItemStorage7.allHeldItemsSM
    static let heldItemsUSUM: [UInt16] = ItemStorage7.allHeldItemsUSUM
    static let heldItemsGG: [UInt16] = []
    static let heldItemsSWSH: [UInt16] = ItemStorage8SWSH.allHeldItems
    static let heldItemsBS: [UInt16] = ItemStorage8BDSP.allHeldItems
    static let heldItemsLA: [UInt16] = []
    static let heldItemsSV: [UInt16] = ItemStorage9.allHeldItems

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

    static func getIsFixedIVSequenceValidSkipRand1() {
        // TODO: implement me
    }

    static func getIsFixedIVSequenceValidSkipRand2() {
        // TODO: implement me
    }

    static func getIsFixedIVSequenceValidSkipNoRand() {
        // TODO: implement me
    }
    
    /*
     TODO:
     - isOriginalMovesetDeleted
     - isPPUpAvailable (pk: PKM)
     */
}
