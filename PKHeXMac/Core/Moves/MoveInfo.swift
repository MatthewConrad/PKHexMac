//
//  MoveInfo.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

enum MoveInfo {
    /// Moves that cannot be sketched in Gen9
    static let disallowSketch9: [Move] = [
        .DarkVoid, .HyperspaceFury, .RevivalBlessing, .BlazingTorque, .WickedTorque, .NoxiousTorque, .CombatTorque, .MagicalTorque, .TeraStarstorm
    ]

    static func getPPTable(context: EntityContext) -> [UInt8] {
        switch context {
        case .Gen1:
            return MoveInfo1.movePP
        case .Gen2:
            return MoveInfo2.movePP
        case .Gen3:
            return MoveInfo3.movePP
        case .Gen4:
            return MoveInfo4.movePP
        case .Gen5:
            return MoveInfo5.movePP
        case .Gen6:
            return MoveInfo6.movePP
        case .Gen7:
            return MoveInfo7.movePP
        case .Gen8:
            return MoveInfo8.movePP
        case .Gen9:
            return MoveInfo9.movePP
        case .Gen7b:
            return MoveInfo7b.movePP
        case .Gen8a:
            return MoveInfo8a.movePP
        case .Gen8b:
            return MoveInfo8.movePP
        default:
            return []
        }
    }

    static func getDummiedMovesHashSet(context: EntityContext) -> [UInt8] {
        switch context {
        case .Gen8:
            return MoveInfo8.dummiedMoves
        case .Gen8a:
            return MoveInfo8a.dummiedMoves
        case .Gen8b:
            return MoveInfo8b.dummiedMoves
        case .Gen9:
            return MoveInfo9.dummiedMoves
        default:
            return []
        }
    }

    static func getMaxMove(context: EntityContext) -> Move {
        switch context {
        case .Gen1:
            return Legal.MaxMoveID_1
        case .Gen2:
            return Legal.MaxMoveID_2
        case .Gen3:
            return Legal.MaxMoveID_3
        case .Gen4:
            return Legal.MaxMoveID_4
        case .Gen5:
            return Legal.MaxMoveID_5
        case .Gen6:
            return Legal.MaxMoveID_6_AO
        case .Gen7:
            return Legal.MaxMoveID_7_USUM
        case .Gen7b:
            return Legal.MaxMoveID_7b
        case .Gen8:
            return Legal.MaxMoveID_8
        case .Gen8a:
            return Legal.MaxMoveID_8a
        case .Gen8b:
            return Legal.MaxMoveID_8b
        case .Gen9:
            return Legal.MaxMoveID_9
        default:
            return .None
        }
    }

    static func getMaxMoveID(context: EntityContext) -> Int {
        let max = getMaxMove(context: context)

        return if max == .None {
            -1
        } else {
            Int(max.rawValue)
        }
    }

    /// Gets base PP of a move depending on the context.
    static func getPP(context: EntityContext, move: Move) -> UInt8 {
        let table = getPPTable(context: context)
        return if move.rawValue >= table.count {
            0
        } else {
            table[Int(move.rawValue)]
        }
    }

    static func getType(move: Move, types: [UInt8]) -> UInt8 {
        return if move.rawValue >= types.count {
            0
        } else {
            types[Int(move.rawValue)]
        }
    }

    static func getType(context: EntityContext, move: Move) -> UInt8 {
        return if context == .Gen1 {
            getType(move: move, types: MoveInfo1.moveType)
        } else if (EntityContext.Gen2 ... EntityContext.Gen5).contains(context) {
            getType(move: move, types: MoveInfo5.moveType)
        } else {
            getType(move: move, types: MoveInfo9.moveType)
        }
    }

    static func isMoveZ(move: Move) -> Bool {
        return if (Move.BreakneckBlitzP ... Move.Catastropika).contains(move) {
            true
        } else if (Move.SinisterArrowRaid ... Move.GenesisSupernova).contains(move) {
            true
        } else if (Move.LightThatBurnstheSky ... Move.ClangorousSoulblaze).contains(move) {
            true
        } else if move == .TenMVoltThunderbolt {
            true
        } else {
            false
        }
    }

    static func isMoveDynamax(move: Move) -> Bool {
        (Move.MaxFlare ... Move.MaxSteelspike).contains(move)
    }

    static func isMoveTorque(move: Move) -> Bool {
        (Move.BlazingTorque ... Move.MagicalTorque).contains(move)
    }

    static func isMoveKnowable(move: Move) -> Bool {
        !isMoveZ(move: move) && !isMoveDynamax(move: move) && !isMoveTorque(move: move)
    }

    static func isDummiedMove(bitflags: [UInt8], move: Move) -> Bool {
        let offset = Int(move.rawValue >> 3)
        if offset >= bitflags.count {
            return false
        }

        let bit = move.rawValue & 7
        return if (bitflags[offset] & (1 << bit)) != 0 {
            true
        } else {
            false
        }
    }

    static func isDummiedMove(pk: PKMProtocol, move: Move) -> Bool {
        isDummiedMove(
            bitflags: getDummiedMovesHashSet(context: pk.context),
            move: move)
    }

    static func isDummiedMove(pk: PKMProtocol, moveIndex: Int) -> Bool {
        let bitflags = getDummiedMovesHashSet(context: pk.context)
        return if bitflags.count == 0 {
            false
        } else {
            isDummiedMove(bitflags: bitflags, move: pk.getMove(index: moveIndex))
        }
    }

    /// Checks if any move in the currently known moves is unusable
    static func isDummiedMoveAny(pk: PKMProtocol) -> Bool {
        let bitflags = getDummiedMovesHashSet(context: pk.context)
        if bitflags.count == 0 {
            return false
        }

        return pk.getMoves().contains { isDummiedMove(bitflags: bitflags, move: $0) }
    }

    static func isSketchPossible(move: Move) -> Bool {
        switch move {
        case .Struggle, .Chatter:
            return false
        case .LightOfRuin: // Unreleased
            return false
        default:
            return isMoveKnowable(move: move)
        }
    }

    static func isSketchPossible(context: EntityContext, move: Move) -> Bool {
        if !isSketchPossible(move: move) {
            return false
        }

        switch context {
        case .Gen6:
            return ![.ThousandArrows, .ThousandWaves].contains(move)
        case .Gen8b:
            return !isDummiedMove(bitflags: MoveInfo8b.dummiedMoves, move: move)
        case .Gen9:
            return !(isDummiedMove(bitflags: MoveInfo9.dummiedMoves, move: move) || disallowSketch9.contains(move))
        default:
            return true
        }
    }

    static func isSketchValid(context: EntityContext, move: Move) -> Bool {
        return if move > getMaxMove(context: context) {
            false
        } else {
            isSketchPossible(context: context, move: move)
        }
    }

    static func isAnyFromGeneration(generation: Int, moves: [Move]) -> Bool {
        // TODO: finish after implemented MoveResult
        return false
    }
}
