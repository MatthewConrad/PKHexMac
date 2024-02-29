//
//  ItemStorage5.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/24/24.
//

import Foundation

struct ItemStorage5: IItemStorage {
    private let version: GameVersion

    static let instanceBW = ItemStorage5(version: GameVersion.BW)
    static let instanceB2W2 = ItemStorage5(version: GameVersion.B2W2)

    /* Items */
    private static let pouchItems: [Int] = [
        01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16,
        55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
        70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
        80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
        90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
        100, 101, 102, 103, 104, 105, 106, 107, 108, 109,
        110, 111, 112, 116, 117, 118, 119, 135, 136, 137, 138, 139,
        140, 141, 142, 143, 144, 145, 146, 147, 148,
        213, 214, 215, 216, 217, 218, 219,
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
        320, 321, 322, 323, 324, 325, 326, 327,
        492, 493, 494, 495, 496, 497, 498, 499,
        500, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549,
        550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 564,
        571, 572, 573, 575, 576, 577, 580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590,
    ]

    /* Key Items */
    private static let pouchKeyBW: [Int] = [
        437, 442, 447, 450, 465, 466, 471, 504, 533, 574, 578, 579, 616, 617, 621, 623, 624, 625, 626,
    ]
    private static let pouchKeyB2W2: [Int] = [
        437, 442, 447, 450, 453, 458, 465, 466, 471, 504, 578,
        616, 617, 621, 626, 627, 628, 629, 630, 631, 632, 633, 634, 635, 636, 637, 638,
    ]

    /* TMs & HMs */
    private static let pouchTMHM: [Int] = [
        328, 329, 330, 331, 332, 333, 334, 335, 336, 337,
        338, 339, 340, 341, 342, 343, 344, 345, 346, 347,
        348, 349, 350, 351, 352, 353, 354, 355, 356, 357,
        358, 359, 360, 361, 362, 363, 364, 365, 366, 367,
        368, 369, 370, 371, 372, 373, 374, 375, 376, 377,
        378, 379, 380, 381, 382, 383, 384, 385, 386, 387,
        388, 389, 390, 391, 392, 393, 394, 395, 396, 397,
        398, 399, 400, 401, 402, 403, 404, 405, 406, 407,
        408, 409, 410, 411, 412, 413, 414, 415, 416, 417,
        418, 419, // 01-92

        618, 619, 620, // 93-95
        420, 421, 422, 423, 424, 425,
    ]

    /* Medicine */
    private static let pouchMedicine: [Int] = [
        17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
        30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
        50, 51, 52, 53, 54, 134, 504, 565, 566, 567, 568, 569, 570, 591,
    ]

    /* Berries */
    private static let pouchBerries: [Int] = [
        149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159,
        160, 161, 162, 163, 164, 165, 166, 167, 168, 169,
        170, 171, 172, 173, 174, 175, 176, 177, 178, 179,
        180, 181, 182, 183, 184, 185, 186, 187, 188, 189,
        190, 191, 192, 193, 194, 195, 196, 197, 198, 199,
        200, 201, 202, 203, 204, 205, 206, 207, 208, 209,
        210, 211, 212,
    ]

    static let unreleased: [Int] = [
        005, // Safari Ball
        016, // Cherish Ball
        260, // Red Scarf
        261, // Blue Scarf
        262, // Pink Scarf
        263, // Green Scarf
        264, // Yellow Scarf
        492, // Fast Ball
        493, // Level Ball
        494, // Lure Ball
        495, // Heavy Ball
        496, // Love Ball
        497, // Friend Ball
        498, // Moon Ball
        499, // Sport Ball
        500, // Park Ball
        576, // Dream Ball
    ]

    static let allHeldItems = pouchItems + pouchMedicine + pouchBerries

    func isLegal(type: InventoryType, itemIndex: Int, itemCount: Int) -> Bool {
        return true
    }

    func getItems(type: InventoryType) -> [Int] {
        switch type {
        case .Items:
            return ItemStorage5.pouchItems
        case .KeyItems:
            return if version == GameVersion.B2W2 {
                ItemStorage5.pouchKeyB2W2
            } else {
                ItemStorage5.pouchKeyBW
            }
        case .TMHMs:
            return ItemStorage5.pouchTMHM
        case .Medicine:
            return ItemStorage5.pouchMedicine
        case .Berries:
            return ItemStorage5.pouchBerries
        default:
            return []
        }
    }
}
