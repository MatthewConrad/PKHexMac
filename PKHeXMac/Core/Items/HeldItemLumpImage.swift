//
//  HeldItemLumpImage.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/18/24.
//

import Foundation

/// Lumped image type
enum HeldItemLumpImage: Int, CaseIterable, Comparable {
    case NotLump = 0,
         TechnicalMachine,
         TechnicalRecord

    static func < (lhs: HeldItemLumpImage, rhs: HeldItemLumpImage) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

    /// Checks if the image is a lumped sprite.
    func isLump() -> Bool {
        return self != .NotLump
    }

    /// Checks if the `item` should show a lumped sprite.
    static func getIsLump(item: Int, context: EntityContext) -> HeldItemLumpImage {
        let gen = context.generation()

        return if gen <= 4 && (0328...0419).contains(item) {
            // Gen 2/3/4 TM
            .TechnicalMachine
        } else if gen == 8 && (0328...0427).contains(item) {
            // BDSP TMs
            .TechnicalMachine
        } else if gen == 8 && (1130...1229).contains(item) {
            // Gen8 TR
            .TechnicalRecord
        } else if gen == 9 && ((0328...0419).contains(item) || (0618...0620).contains(item) || (0690...0693).contains(item) || (2160...2289).contains(item)) {
            // TM01-92 || TM93-TM95 || TM96-TM99 || TM100-TM229
            .TechnicalMachine
        } else {
            .NotLump
        }
    }
}
