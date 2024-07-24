//
//  EvolutionGroup.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 5/20/24.
//

import Foundation

// Checks soure of a move in games that it represents.
protocol EvolutionGroup {
    /// Gets the previous generation group to traverse to continue processing.
    func getPrevious(pk: PKMProtocol, enc: EvolutionOrigin) -> EvolutionGroup?

    /// Gets the next generation group to traverse to continue processing.
    func getNext(pk: PKMProtocol, enc: EvolutionOrigin) -> EvolutionGroup?

    /// Walks down the evolution chain to find previous evolutions.
    func devolve(result: inout [EvoCriteria], pk: PKMProtocol, enc: EvolutionOrigin) -> Int

    /// Walks up the evolution chain to find the evolution path.
    func evolve(result: inout [EvoCriteria], pk: PKMProtocol, enc: EvolutionOrigin, history: EvolutionHistory) -> Int

    /// Discards all entries that do not exist in the group
    func discardForOrigin(result: inout [EvoCriteria], pk: PKMProtocol, enc: EvolutionOrigin)
}

// declaring enum instead of using `extension` because need static func
enum EvolutionGroupUtil {
    static func getGroup(context: EntityContext) -> EvolutionGroup {
        fatalError("not implemented!")
    }
}

/// Provides information about how to evolve to the next evolution stage.
protocol EvolutionEnvironment {
    /// Attempts to devolve the provided `head` to the previous evolution.
    /// - returns `true` is the de-evolution was successful and `result` should be used
    func tryDevolve<T: SpeciesForm>(_ head: T, pk: PKMProtocol, currentMaxLevel: UInt8, levelMin: UInt8, skipChecks: Bool) -> (success: Bool, result: EvoCriteria?)

    /// Attempts to evolve the provided `head` to the next evolution.
    /// - returns `true` is the evolution was successful and `result` should be used
    func tryEvolve<T: SpeciesForm>(_ head: T, next: SpeciesForm, pk: PKMProtocol, currentMaxLevel: UInt8, levelMin: UInt8, skipChecks: Bool) -> (success: Bool, result: EvoCriteria?)
}
