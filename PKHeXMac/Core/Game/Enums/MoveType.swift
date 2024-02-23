//
//  MoveType.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/6/24.
//

import Foundation

/// Elemental type a move has; additionally, types a PKM can have.
 enum MoveType: Int, CaseIterable, Comparable {

    case AnyMoveType = -1,
    Normal = 0,
    Fighting = 1,
    Flying = 2,
    Poison = 3,
    Ground = 4,
    Rock = 5,
    Bug = 6,
    Ghost = 7,
    Steel = 8,
    Fire = 9,
    Water = 10,
    Grass = 11,
    Electric = 12,
    Psychic = 13,
    Ice = 14,
    Dragon = 15,
    Dark = 16,
    Fairy = 17

     static func < (lhs: MoveType, rhs: MoveType) -> Bool {
         return lhs.rawValue < rhs.rawValue
     }

     static func - (lhs: MoveType, rhs: Int) -> MoveType {
         let rawSubtract = lhs.rawValue - rhs
         return MoveType.init(rawValue: rawSubtract) ?? .AnyMoveType
     }

     func getMoveTypeFromG12() -> MoveType {
         var type = self
         if type <= .Rock {
             return type
         }

         type = type - 1
         if type <= .Steel {
             return type
         }

         type = type - 10
         return type
     }

     func getMoveTypeForGeneration(generation: Int) -> MoveType {
         if generation <= 2 {
             return self.getMoveTypeFromG12()
         }

         return self
     }
}
