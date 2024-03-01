//
//  LearnOption.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/29/24.
//

import Foundation

enum LearnOption {
    case Current, // assumes move is in current moveset
         /// Assumes that move was known at any time while existing in the source game.
         /// - remark: Only relevant for memory checks.
         ///           For not-transferable moves like Gen4/5 HM moves, there's no point in checking them as they aren't requisites for anything.
         ///           Evolution criteria is handled separately.
         AtAnyTime,

         /// Assumes that move was taught in HOME, for sharing acquired movesets between games.
         /// - remark: Relevant for HOME sharing sanity checks.
         ///           Required to be distinct in that the rules are different from the other two options.
         ///           TR/TM flags aren't required if the move was learned via HOME.
         HOME

    func isCurrent() -> Bool {
        return self == .Current
    }

    func isPast() -> Bool {
        return self == .AtAnyTime || self == .HOME
    }

    func isFlagCheckRequired() -> Bool {
        return self != .HOME
    }
}
