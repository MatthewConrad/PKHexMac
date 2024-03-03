//
//  PersonalType.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

/// Exposes info about the MoveType of an entity
protocol PersonalType {
    var type1: Int { get set }
    var type2: Int { get set }
}

extension PersonalType {
    func isType(type: Int) -> Bool {
        self.type1 == type || self.type2 == type
    }

    func isType(type1: Int, type2: Int) -> Bool {
        self.type1 == type1 && self.type2 == type2 || self.type1 == type2 && self.type2 == type1
    }

    func isValidTypeCombination(type1: Int, type2: Int) -> Bool {
        self.type1 == type1 && self.type2 == type2
    }
}
