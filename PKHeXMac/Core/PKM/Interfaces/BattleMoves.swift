//
//  BattleMoves.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

/// Exposes information about in-battle movesets.
/// - remark: moved from original repo's PKM monolith
protocol BattleMoves {
    var move1: Move { get set }
    var move2: Move { get set }
    var move3: Move { get set }
    var move4: Move { get set }

    var move1PP: Int { get set }
    var move2PP: Int { get set }
    var move3PP: Int { get set }
    var move4PP: Int { get set }

    var move1PPUps: Int { get set }
    var move2PPUps: Int { get set }
    var move3PPUps: Int { get set }
    var move4PPUps: Int { get set }
}

extension BattleMoves {
    func getMove(index: Int) -> Move {
        switch index {
        case 0:
            return self.move1
        case 1:
            return self.move2
        case 2:
            return self.move3
        case 3:
            return self.move4
        default:
            return .None
        }
    }

    func getMoves() -> [Move] {
        [self.move1, self.move2, self.move3, self.move4]
    }
    
    // TODO: add setMoves overload with Moveset arg

    mutating func setMoves(moves: [Move]) {
        if moves.count > 0 {
            self.move1 = moves[0]
        }

        if moves.count > 1 {
            self.move2 = moves[1]
        }

        if moves.count > 2 {
            self.move3 = moves[2]
        }

        if moves.count > 3 {
            self.move4 = moves[3]
        }

        // TODO: set maximum PP after MoveApplicator
    }

    func hasMove(move: Move) -> Bool {
        self.getMoves().contains(move)
    }
}
