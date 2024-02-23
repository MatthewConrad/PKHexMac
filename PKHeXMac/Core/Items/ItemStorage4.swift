//
//  ItemStorage4.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/21/24.
//

import Foundation

struct ItemStorage4: IItemStorage {
    private let version: GameVersion

    static let instanceDP = ItemStorage4(version: GameVersion.DP)
    static let instancePt = ItemStorage4(version: GameVersion.Pt)
    static let instanceHGGS = ItemStorage4(version: GameVersion.HGSS)

    /* Items */
    private static let pouchItems: [Int] = [
        68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
        80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
        90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
        100, 101, 102, 103, 104, 105, 106, 107, 108, 109,
        110, 111, 135, 136, 213, 214, 215, 216, 217, 218, 219,
        220, 221, 222, 223, 224, 225, 226, 227, 228, 229,
        230, 231, 232, 233, 234, 235, 236, 237, 238, 239,
        240, 241, 242, 243, 244, 245, 246, 247, 248, 249,
        250, 251, 252, 253, 254, 255, 256, 257, 258, 259,
        260, 261, 262, 263, 264, 265, 266, 267, 268, 269,
        270, 271, 272, 273, 274, 275, 276, 277, 278, 279,
        280, 281, 282, 283, 284, 285, 286, 287, 288, 289,
        290, 291, 292, 293, 294, 295, 296, 297, 298, 299,
        300, 301, 302, 303, 304, 305, 306, 307, 308, 309,
        310, 311, 312, 313, 314, 315, 316, 317, 318, 319,
        320, 321, 322, 323, 324, 325, 326, 327
    ]
    // Platinum adds Griseous Orb
    private static let pouchItemsPt: [Int] = (pouchItems + [112]).sorted()

    /* Key Items */
    private static let pouchKey: [Int] = [
        428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439,
        440, 441, 442, 443, 444, 445, 446, 447, 448, 449,
        450, 451, 452, 453, 454, 455, 456, 457, 458, 459,
        460, 461, 462, 463, 464
    ]

    private static let keyItemsPt: [Int] = [465, 466, 467]
    private static let pouchKeyPt: [Int] = pouchKey + keyItemsPt

    private static let pouchKeyHGSS: [Int] = [
        434, 435, 437, 444, 445, 446, 447, 450, 456, 464, 465, 466, 468, 469,
        470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484,
        501, 502, 503, 504, 532, 533, 534, 535, 536
    ]

    /* TMs & HMs */
    private static let pouchTM: [Int] = [
        328, 329, 330, 331, 332, 333, 334, 335, 336, 337,
        338, 339, 340, 341, 342, 343, 344, 345, 346, 347,
        348, 349, 350, 351, 352, 353, 354, 355, 356, 357,
        358, 359, 360, 361, 362, 363, 364, 365, 366, 367,
        368, 369, 370, 371, 372, 373, 374, 375, 376, 377,
        378, 379, 380, 381, 382, 383, 384, 385, 386, 387,
        388, 389, 390, 391, 392, 393, 394, 395, 396, 397,
        398, 399, 400, 401, 402, 403, 404, 405, 406, 407,
        408, 409, 410, 411, 412, 413, 414, 415, 416, 417,
        418, 419
    ]
    private static let pouchHM: [Int] = [420, 421, 422, 423, 424, 425, 426, 427]
    private static let pouchTMHM: [Int] = pouchTM + pouchHM

    /* Mail */
    private static let pouchMail: [Int] = [
        137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148
    ]

    /* Medicine */
    private static let pouchMedicine: [Int] = [
        17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
        30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
        40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
        50, 51, 52, 53, 54
    ]

    /* Berries */
    private static let pouchBerries: [Int] = [
        149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159,
        160, 161, 162, 163, 164, 165, 166, 167, 168, 169,
        170, 171, 172, 173, 174, 175, 176, 177, 178, 179,
        180, 181, 182, 183, 184, 185, 186, 187, 188, 189,
        190, 191, 192, 193, 194, 195, 196, 197, 198, 199,
        200, 201, 202, 203, 204, 205, 206, 207, 208, 209,
        210, 211, 212
    ]

    /* Battle */
    private static let pouchBattle: [Int] = [
        // stat ups
        55, 56, 57, 58, 59, 60, 61, 62,
        // in-battle
        63, 64, 65, 66, 67
    ]

    /* PokeBalls */
    private static let pouchBall: [Int] = [
        1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
    ]
    // HGSS adds apriball
    private static let pouchApriBall: [Int] = [492, 493, 494, 495, 496, 497, 498, 499, 500]
    private static let pouchBallHGSS: [Int] = pouchBall + pouchApriBall

    /* Misc */
    private static let unreleased: [Int] = [
        005, // Safari ball
        016, // Cherish
        147, // Mosaic Mail
        499, // Sport Ball
        500 // Park Ball
    ]

    /* All Held items */
    private static let sharedHeldItems = pouchMail + pouchMedicine + pouchBerries + pouchBall + pouchTM
    static let allHeldItems = pouchItems + sharedHeldItems
    static let allHeldItemsPt = pouchItemsPt + sharedHeldItems

    func isLegal(type: InventoryType, itemIndex: Int, itemCount: Int) -> Bool {
        return true
    }

    func getItems(type: InventoryType) -> [Int] {
        switch type {
        case .Items:
            return if version == GameVersion.DP {
                ItemStorage4.pouchItems
            } else {
                ItemStorage4.pouchItemsPt
            }
        case .KeyItems:
            return if version == GameVersion.HGSS {
                ItemStorage4.pouchKeyHGSS
            } else if version == GameVersion.Pt {
                ItemStorage4.pouchKeyPt
            } else {
                ItemStorage4.pouchKey
            }
        case .TMHMs:
            return ItemStorage4.pouchTMHM
        case .MailItems:
            return ItemStorage4.pouchMail
        case .Medicine:
            return ItemStorage4.pouchMedicine
        case .Berries:
            return ItemStorage4.pouchBerries
        case .Balls:
            return if version == GameVersion.HGSS {
                ItemStorage4.pouchBallHGSS
            } else {
                ItemStorage4.pouchBall
            }
        case .BattleItems:
            return ItemStorage4.pouchBattle
        default:
            return []
        }
    }
}
