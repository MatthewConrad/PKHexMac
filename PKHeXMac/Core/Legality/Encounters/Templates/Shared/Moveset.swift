//
//  Moveset.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Set of 4 moves that are in a list of moves
struct Moveset {
    let move1: Move
    let move2: Move
    let move3: Move
    let move4: Move

    init(move1: Move = .None, move2: Move = .None, move3: Move = .None, move4: Move = .None) {
        self.move1 = move1
        self.move2 = move2
        self.move3 = move3
        self.move4 = move4
    }

    init(moves: [Move]) {
        self.move1 = moves[0]
        self.move2 = moves[1]
        self.move3 = moves[2]
        self.move4 = moves[3]
    }

    let defaultSeparator: String = " / "
    var hasMoves: Bool {
        move1 != .None
    }

    func contains(move: Move) -> Bool {
        [move1, move2, move3, move4].contains(move)
    }

    func anyAbove(max: Move) -> Bool {
        move1 > max || move2 > max || move3 > max || move4 > max
    }

    func toArray() -> [Move] {
        [move1, move2, move3, move4]
    }

    func copyTo(_ moves: inout [Move]) {
        moves[3] = move4
        moves[2] = move3
        moves[1] = move2
        moves[0] = move1
    }

    func containsAny(moves: [Move]) -> Bool {
        for move in moves {
            if contains(move: move) {
                return true
            }
        }

        return false
    }

    func containsAll(needs: [Move]) -> Bool {
        for move in needs {
            if !contains(move: move) {
                return false
            }
        }

        return true
    }

    func getMovesetLine(names: [String], split: String?) -> String {
        let splitString = split ?? defaultSeparator
        var line = ""

        let moves = toArray()
        for (index, move) in moves.enumerated() {
            if move != .None {
                line.append(names[Int(move.rawValue)])

                if index < moves.count - 1 {
                    line.append(splitString)
                }
            }
        }

        return line
    }

    /// Flag each present index; having all moves will have all bitflags.
    func bitOverlap(span: [Move]) -> Int {
        var flags = 0
        for (index, move) in span.enumerated() {
            if contains(move: move) {
                flags |= 1 << index
            }
        }

        return flags
    }

    static func bitOverlap(moves: [Move], span: [Move]) -> Int {
        let moveset = Moveset(moves: moves)
        return moveset.bitOverlap(span: span)
    }
}
