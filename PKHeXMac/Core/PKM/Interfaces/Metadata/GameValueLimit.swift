//
//  GameValueLimit.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

// TODO: swap to enums for species, move, etc.
protocol GameValueLimit {
    var maxSpeciesID: Int { get }
    var maxMoveID: Int { get }
    var maxItemID: Int { get }
    var maxAbilityID: Int { get }
    var maxBallID: Int { get }

    var maxGameID: GameVersion { get }
    var minGameID: GameVersion { get }

    var maxIV: Int { get }
    var maxEV: Int { get }

    var maxLengthOT: Int { get }
    var maxLengthNickname: Int { get }
}
