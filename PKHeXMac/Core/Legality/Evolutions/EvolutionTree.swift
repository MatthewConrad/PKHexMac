//
//  EvolutionTree.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/14/24.
//

import Foundation

struct EvolutionTree: EvolutionNetwork {
    var forward: EvolutionForward
    var reverse: EvolutionReverse

    static let maxEvolutions: Int = 3

    private func getViaSpecies(table: any PersonalTable, entries: [[EvolutionMethod]]) -> EvolutionTree {}
}
