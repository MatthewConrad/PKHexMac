//
//  MoveSourceType.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Indicates the source of a Move for a PKM.
struct MoveSourceType: OptionSet {
    let rawValue: UInt8

    static let none = MoveSourceType([])
    static let levelUp = MoveSourceType(rawValue: 1 << 0)
    static let relearnMoves = MoveSourceType(rawValue: 1 << 1)
    static let machine = MoveSourceType(rawValue: 1 << 2)
    static let typeTutor = MoveSourceType(rawValue: 1 << 3)
    static let specialTutor = MoveSourceType(rawValue: 1 << 4)
    static let enhancedTutor = MoveSourceType(rawValue: 1 << 5)
    static let sharedEggMove = MoveSourceType(rawValue: 1 << 6)
    static let technicalRecord = MoveSourceType(rawValue: 1 << 7)
    static let evolve = MoveSourceType(rawValue: 1 << 8)

    static let allTutors: MoveSourceType = [.typeTutor, .specialTutor, .enhancedTutor]
    static let allMachines: MoveSourceType = [.machine, .technicalRecord]

    static let reminder: MoveSourceType = [.levelUp, .relearnMoves, .technicalRecord, .evolve]
    static let encounter: MoveSourceType = [.levelUp, .relearnMoves]
    static let externalSources: MoveSourceType = [.reminder, .allMachines, .allTutors]
    static let all: MoveSourceType = [.externalSources, .sharedEggMove, .relearnMoves]

    /// Masks out the flags to only leave those that are possible for eggs.
    func clearNonEggSources() -> MoveSourceType {
        intersection(.encounter)
    }
}
