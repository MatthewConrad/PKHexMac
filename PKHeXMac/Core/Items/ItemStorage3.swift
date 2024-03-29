//
//  ItemStorage3.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/21/24.
//

import Foundation

struct ItemStorage3: ItemStorage {
    private let version: GameVersion

    static let instanceRS = ItemStorage3(version: GameVersion.RS)
    static let instanceFRLG = ItemStorage3(version: GameVersion.FRLG)
    static let instanceE = ItemStorage3(version: GameVersion.E)

    static let instanceColo = ItemStorage3(version: GameVersion.COLO)
    static let instanceXD = ItemStorage3(version: GameVersion.XD)

    /* Items */
    private static let pouchItems: [UInt16] = [
        13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
        32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
        51, 63, 64, 65, 66, 67, 68, 69, 70, 71, 73, 74, 75, 76, 77, 78, 79, 80, 81,
        83, 84, 85, 86, 93, 94, 95, 96, 97, 98, 103, 104, 106, 107, 108, 109, 110,
        111, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 179, 180,
        181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195,
        196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210,
        211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225,
        254, 255, 256, 257, 258
    ]

    // Colosseum adds Time Flute
    private static let pouchItemsColo: [UInt16] = pouchItems + [537]
    // XD adds PokeSnack
    private static let pouchItemsXD: [UInt16] = pouchItems + [511]

    /* Key Items */
    private static let pouchKey: [UInt16] = [
        259, 260, 261, 262, 263, 264, 265, 266, 268, 269, 270, 271, 272, 273, 274,
        275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288
    ]
    private static let keyItemsFRLG: [UInt16] = [349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374]
    private static let keyItemsE: [UInt16] = [375, 376]

    private static let pouchKeyFRLG: [UInt16] = pouchKey + keyItemsFRLG
    private static let pouchKeyE: [UInt16] = pouchKeyFRLG + keyItemsE

    private static let pouchKeyColo: [UInt16] = [
        500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519,
        520, 521, 522, 523, 524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 538, 539,
        540, 541, 542, 546, 547
    ]

    private static let pouchKeyXD: [UInt16] = [
        500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 512, 516, 517, 518, 519,
        523, 524, 525, 526, 527, 528, 529, 530, 531, 532, 533
    ]

    /* TMs & HMs */
    private static let pouchTM: [UInt16] = [
        289, 290, 291, 292, 293, 294, 295, 296, 297, 298,
        299, 300, 301, 302, 303, 304, 305, 306, 307, 308,
        309, 310, 311, 312, 313, 314, 315, 316, 317, 318,
        319, 320, 321, 322, 323, 324, 325, 326, 327, 328,
        329, 330, 331, 332, 333, 334, 335, 336, 337, 338
    ]

    private static let pouchHM: [UInt16] = [339, 340, 341, 342, 343, 344, 345, 346]
    private static let pouchTMHM: [UInt16] = pouchTM + pouchHM

    /* Berries */
    private static let pouchBerries: [UInt16] = [
        133, 134, 135, 136, 137, 138, 139,
        140, 141, 142, 143, 144, 145, 146, 147, 148, 149,
        150, 151, 152, 153, 154, 155, 156, 157, 158, 159,
        160, 161, 162, 163, 164, 165, 166, 167, 168, 169,
        170, 171, 172, 173, 174, 175
    ]

    /* PokeBalls */
    private static let pouchBall: [UInt16] = [
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
    ]
    private static let unreleased: [UInt16] = [005] // Safari Ball

    /* Colognes */
    private static let pouchCologneColo: [UInt16] = [543, 544, 545]
    private static let pouchCologneXD: [UInt16] = [513, 514, 515]

    /* Disks (XD only) */
    private static let pouchDiscXD: [UInt16] = [
        534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549,
        550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 564, 565,
        566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579,
        580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593
    ]

    /* Held and PC item sets */
    static let allHeldItems = pouchItems + pouchBall + pouchBerries + pouchTM

    private static let pcItemsRS = allHeldItems + pouchKey + pouchHM
    private static let pcItemsFRLG = pcItemsRS + keyItemsFRLG
    private static let pcItemsE = pcItemsRS + keyItemsE

    func isLegal(type: InventoryType, itemIndex: Int, itemCount: Int) -> Bool {
        return true
    }

    func getItems(type: InventoryType) -> [UInt16] {
        switch type {
        case .Items:
            return if version == GameVersion.XD {
                ItemStorage3.pouchItemsXD
            } else if version == GameVersion.COLO {
                ItemStorage3.pouchItemsColo
            } else {
                ItemStorage3.pouchItems
            }
        case .KeyItems:
            return if version == GameVersion.XD {
                ItemStorage3.pouchKeyXD
            } else if version == GameVersion.COLO {
                ItemStorage3.pouchKeyColo
            } else if version == GameVersion.E {
                ItemStorage3.pouchKeyE
            } else if version == GameVersion.FRLG {
                ItemStorage3.pouchKeyFRLG
            } else {
                ItemStorage3.pouchKey
            }
        case .Balls:
            return ItemStorage3.pouchBall
        case .TMHMs:
            return if GameVersion.CXD.contains(game: version) {
                ItemStorage3.pouchTM
            } else {
                ItemStorage3.pouchTMHM
            }
        case .Berries:
            return ItemStorage3.pouchBerries
        case .PCItems:
            return if GameVersion.CXD.contains(game: version) {
                []
            } else if version == GameVersion.E {
                ItemStorage3.pcItemsE
            } else if version == GameVersion.FRLG {
                ItemStorage3.pcItemsFRLG
            } else {
                ItemStorage3.pcItemsRS
            }
        case .Medicine:
            return if version == GameVersion.XD {
                ItemStorage3.pouchCologneXD
            } else if version == GameVersion.COLO {
                ItemStorage3.pouchCologneColo
            } else {
                []
            }
        case .BattleItems:
            return if version == GameVersion.XD {
                ItemStorage3.pouchDiscXD
            } else {
                []
            }
        default:
            return []
        }
    }
}
