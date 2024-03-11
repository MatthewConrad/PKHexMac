//
//  PK9.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/10/24.
//

import Foundation

struct PK9: PKM {
    var context: EntityContext
    
    var version: GameVersion
    
    var originalTrainerName: String
    
    var originalTrainerGender: UInt8
    
    var language: Int
    
    var species: Species
    
    var form: Int
    
    var statLevel: UInt8
    
    var statHPMax: Int
    
    var statHPCurrent: Int
    
    var statATK: Int
    
    var statDEF: Int
    
    var statSPE: Int
    
    var statSPA: Int
    
    var statSPD: Int
    
    var stats: [Int]
    
    var move1: Move
    
    var move2: Move
    
    var move3: Move
    
    var move4: Move
    
    var move1PP: Int
    
    var move2PP: Int
    
    var move3PP: Int
    
    var move4PP: Int
    
    var move1PPUps: Int
    
    var move2PPUps: Int
    
    var move3PPUps: Int
    
    var move4PPUps: Int
    
    var gvHP: UInt8
    
    var gvATK: UInt8
    
    var gvDEF: UInt8
    
    var gvSPE: UInt8
    
    var gvSPA: UInt8
    
    var gvSPD: UInt8
    
    var ID32: UInt32
    
    var SID16: Int
    
    var metLocation: UInt16
    
    var isEgg: Bool
    
    var eggLocation: UInt16
    
    var eggMetDate: Date
    
    var isShiny: Bool
    
    var nickname: String
    
    var isNicknamed: Bool
    
    var maxSpeciesID: Int
    
    var maxMoveID: Int
    
    var maxItemID: Int
    
    var maxAbilityID: Int
    
    var maxBallID: Int
    
    var maxGameID: GameVersion
    
    var minGameID: GameVersion
    
    var maxIV: Int
    
    var maxEV: Int
    
    var maxLengthOT: Int
    
    var maxLengthNickname: Int
    
    var evHP: Int
    
    var evATK: Int
    
    var evDEF: Int
    
    var evSPE: Int
    
    var evSPA: Int
    
    var evSPD: Int
    
    var ivHP: Int
    
    var ivATK: Int
    
    var ivDEF: Int
    
    var ivSPE: Int
    
    var ivSPA: Int
    
    var ivSPD: Int
    
    var TID16: Int
    
    var TrainerIDDisplayFormat: TrainerIDFormat
}
