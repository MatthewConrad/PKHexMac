//
//  ItemStorage8BDSP.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/29/24.
//

import Foundation

struct ItemStorage8BDSP: ItemStorage {
    static let instance = ItemStorage8BDSP()

    private static let pouchItems: [UInt16] = [
        045, 046, 047, 048, 049, 050, 051, 052, 053, 072, 073, 074, 075, 076, 077, 078,
        079, 080, 081, 082, 083, 084, 085, 093, 094, 107, 108, 109, 110, 111, 112, 135,
        136, 213, 214, 215, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228,
        229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244,
        245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260,
        261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276,
        277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292,
        293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308,
        309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324,
        325, 326, 327, 537, 565, 566, 567, 568, 569, 570, 644, 645, 849,

        1231, 1232, 1233, 1234, 1235, 1236, 1237, 1238,
    ]

    private static let pouchKey: [UInt16] = [
        428, 431, 432, 433, 438, 439, 440, 443, 445, 446, 447, 448, 449, 450, 451, 452,
        453, 454, 455, 459, 460, 461, 462, 463, 464, 466, 467, 631, 632,

        1267, 1278, 1822,
    ]

    private static let pouchMedicine: [UInt16] = [
        017, 018, 019, 020, 021, 022, 023, 024, 025, 026, 027, 028, 029, 030, 031, 032, 033, 034, 035, 036, 037,
        038, 039, 040, 041, 042, 043, 044, 054,
    ]

    private static let pouchBerries: [UInt16] = [
        149, 150, 151, 152, 153, 154, 155, 156, 157, 158,
        159, 160, 161, 162, 163, 164, 165, 166, 167, 168,
        169, 170, 171, 172, 173, 174, 175, 176, 177, 178,
        179, 180, 181, 182, 183, 184, 185, 186, 187, 188,
        189, 190, 191, 192, 193, 194, 195, 196, 197, 198,
        199, 200, 201, 202, 203, 204, 205, 206, 207, 208,
        209, 210, 211, 212, 686,
    ]

    private static let pouchBall: [UInt16] = [
        001, 002, 003, 004, 005, 006, 007, 008, 009, 010, 011, 012, 013, 014, 015, 016,
        492, 493, 494, 495, 496, 497, 498, 499, 500, 576, 851,
    ]

    private static let pouchBattle: [UInt16] = [
        055, 056, 057, 058, 059, 060, 061, 062, 063,
    ]

    private static let pouchTMHM: [UInt16] = [
        328, 329, 330, 331, 332, 333, 334, 335, 336, 337,
        338, 339, 340, 341, 342, 343, 344, 345, 346, 347,
        348, 349, 350, 351, 352, 353, 354, 355, 356, 357,
        358, 359, 360, 361, 362, 363, 364, 365, 366, 367,
        368, 369, 370, 371, 372, 373, 374, 375, 376, 377,
        378, 379, 380, 381, 382, 383, 384, 385, 386, 387,
        388, 389, 390, 391, 392, 393, 394, 395, 396, 397,
        398, 399, 400, 401, 402, 403, 404, 405, 406, 407,
        408, 409, 410, 411, 412, 413, 414, 415, 416, 417,
        418, 419,
        420, 421, 422, 423, 424, 425, 426, 427, // Previously called HM0X, in BD/SP they're now called TM93-TM100
    ]

    private static let pouchHeldTreasure: [UInt16] = [
        086, 087, 088, 089, 090, 091, 092, 099, 100, 101, 102, 103, 104, 105, 106, 795, 796,
    ]

    private static let pouchTreasure: [UInt16] = pouchHeldTreasure + [
        1808, 1809, 1810, 1811, 1812, 1813, 1814, 1815, 1816, 1817, 1818, 1819, 1820, 1821,
    ]

    static let unreleased: [UInt16] = [
        005, // Safari Ball
        016, // Cherish Ball
        044, // Sacred Ash
        499, // Sport Ball
        500, // Park Ball
        537, // Prism Scale
        565, // Health Feather
        566, // Muscle Feather
        567, // Resist Feather
        568, // Genius Feather
        569, // Clever Feather
        570, // Swift Feather
        576, // Dream Ball
        849, // Ice Stone
        851, // Beast Ball
    ]

    private static let validTypes: [InventoryType] = [
        .Items, .KeyItems, .TMHMs, .Medicine, .Berries, .Balls, .BattleItems, .Treasure,
    ]

    public static let allHeldItems = pouchItems + pouchBall + pouchBattle + pouchBerries + pouchTMHM + pouchMedicine + pouchHeldTreasure

    func isLegal(type: InventoryType, itemIndex: Int, itemCount: Int) -> Bool {
        return if type == .KeyItems {
            true
        } else {
            !ItemStorage8BDSP.unreleased.contains(UInt16(itemIndex))
        }
    }

    func getItems(type: InventoryType) -> [UInt16] {
        switch type {
        case .Items:
            return ItemStorage8BDSP.pouchItems
        case .KeyItems:
            return ItemStorage8BDSP.pouchKey
        case .TMHMs:
            return ItemStorage8BDSP.pouchTMHM
        case .Medicine:
            return ItemStorage8BDSP.pouchMedicine
        case .Berries:
            return ItemStorage8BDSP.pouchBerries
        case .Balls:
            return ItemStorage8BDSP.pouchBall
        case .BattleItems:
            return ItemStorage8BDSP.pouchBattle
        case .Treasure:
            return ItemStorage8BDSP.pouchTreasure
        default:
            return []
        }
    }

    func getMaxCount(type: InventoryType) -> Int {
        return if type == .KeyItems {
            1
        } else if ItemStorage8BDSP.validTypes.contains(type) {
            999
        } else {
            0
        }
    }
    
    func getInventoryPouch(itemIndex: Int) -> InventoryType {
        for type in ItemStorage8BDSP.validTypes {
            if getItems(type: type).contains(UInt16(itemIndex)) {
                return type
            }
        }
        
        return .None
    }
}
