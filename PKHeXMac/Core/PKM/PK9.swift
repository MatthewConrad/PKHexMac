////
////  PK9.swift
////  PKHeXMac
////
////  Created by Matthew Conrad on 3/10/24.
////
//
//import Foundation
//
//// TODO: all of it
//struct PK9: PKMProtocol {
//    var abilityNumber: Int
//    
//    init() {
//        
//    }
//    
//    var sizeParty: Int
//    
//    var sizeStored: Int
//    
//    var personalInfo: PersonalInfo
//    
//    var data: [UInt8]
//    
//    init(data: [UInt8]) {
//        
//    }
//    
//    init(size: Int) {
//        
//    }
//    
//    func encrypt() -> [UInt8] {
//        
//    }
//    
//    func updateChecksum() {
//        
//    }
//    
//    var valid: Bool
//    
//    var nicknameTrash: [UInt8]
//    
//    var originalTrainerTrash: [UInt8]
//    
//    var context: EntityContext
//    
//    var version: GameVersion
//    
//    var trainerIDDisplayFormat: TrainerIDFormat
//    
//    var gender: UInt8
//    
//    var ability: Ability
//    
//    var exp: UInt
//    
//    var originalTrainerName: String
//    
//    var originalTrainerGender: UInt8
//    
//    var ball: UInt8
//    
//    var metLevel: UInt8
//    
//    var encryptionConstant: UInt
//    
//    var PID: UInt
//    
//    var language: Int
//    
//    var TSV: UInt
//    
//    var PSV: UInt
//    
//    var species: Species
//    
//    var form: UInt8
//    
//    var statLevel: UInt8
//    
//    var statHPMax: Int
//    
//    var statHPCurrent: Int
//    
//    var statATK: Int
//    
//    var statDEF: Int
//    
//    var statSPE: Int
//    
//    var statSPA: Int
//    
//    var statSPD: Int
//    
//    var stats: [Int]
//    
//    var move1: Move
//    
//    var move2: Move
//    
//    var move3: Move
//    
//    var move4: Move
//    
//    var move1PP: Int
//    
//    var move2PP: Int
//    
//    var move3PP: Int
//    
//    var move4PP: Int
//    
//    var move1PPUps: Int
//    
//    var move2PPUps: Int
//    
//    var move3PPUps: Int
//    
//    var move4PPUps: Int
//    
//    var gvHP: UInt8
//    
//    var gvATK: UInt8
//    
//    var gvDEF: UInt8
//    
//    var gvSPE: UInt8
//    
//    var gvSPA: UInt8
//    
//    var gvSPD: UInt8
//    
//    var ID32: UInt
//    
//    var SID16: Int
//    
//    var metLocation: UInt16
//    
//    var isEgg: Bool
//    
//    var eggLocation: UInt16
//    
//    var eggMetDate: Date
//    
//    var nickname: String
//    
//    var isNicknamed: Bool
//    
//    var maxSpeciesID: Int
//    
//    var maxMoveID: Int
//    
//    var maxItemID: Int
//    
//    var maxAbilityID: Int
//    
//    var maxBallID: Int
//    
//    var maxGameID: GameVersion
//    
//    var minGameID: GameVersion
//    
//    var maxIV: Int
//    
//    var maxEV: Int
//    
//    var maxLengthOT: Int
//    
//    var maxLengthNickname: Int
//    
//    var fatefulEncounter: Bool
//    
//    var nature: Nature
//    
//    var evHP: Int
//    
//    var evATK: Int
//    
//    var evDEF: Int
//    
//    var evSPE: Int
//    
//    var evSPA: Int
//    
//    var evSPD: Int
//    
//    var ivHP: Int
//    
//    var ivATK: Int
//    
//    var ivDEF: Int
//    
//    var ivSPE: Int
//    
//    var ivSPA: Int
//    
//    var ivSPD: Int
//    
//    var TID16: Int
//}
