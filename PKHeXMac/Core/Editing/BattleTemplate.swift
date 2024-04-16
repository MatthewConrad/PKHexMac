//
//  BattleTemplate.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/15/24.
//

import Foundation

/// Protocol containing details from a `PKM` relevant for Battling.
/// - remark: Formerly `IBattleTemplate`
protocol BattleTemplate: SpeciesForm, GigantamaxReadable, DynamaxLevelReadable, NatureReadable, TeraTypeReadable {
    var context: EntityContext { get }
    var nickname: String { get }
    var gender: UInt8? { get }

    var heldItem: Int { get }
    var ability: Ability { get }
    var level: UInt8 { get }
    var shiny: Bool { get }
    var friendship: UInt8 { get }
    var formName: String { get }

    var hiddenPowerType: Int { get }
    var EVs: [Int] { get }
    var IVs: [Int] { get }
    var moves: [Move] { get }
}
