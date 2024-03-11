//
//  TrainerInfo.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/10/24.
//

import Foundation

protocol TrainerInfo: TrainerID32 {
    var OT: String { get }
    var gender: UInt8 { get }
    var version: GameVersion { get }
    var language: Int { get }
    var generation: UInt8 { get }
    var context: EntityContext { get }
}

extension TrainerInfo {
    func isMatchVersion(pk: PKM) -> Bool {
        return if self.version == pk.version {
            true
        } else if pk.GO_LGPE {
            [.GP, .GE].contains(self.version)
        } else {
            false
        }
    }

    /// Checks if matches the PKM's original trainer data, ignoring version.
    func isFromTrainerNoVersion(pk: PKM) -> Bool {
        return if self.ID32 != pk.ID32 {
            false
        } else if self.OT != pk.originalTrainerName {
            false
        } else if pk.format == 3 {
            true // Gen3 does not check OT Gender nor Pokemon Version
        } else if self.gender != pk.originalTrainerGender {
            if pk.format == 2, let cd = pk as? CaughtData2 {
                cd.caughtData == 0
            } else {
                false
            }
        } else {
            true
        }
    }

    /// Checks trainer match if entity is still an Egg
    func isFromTrainerEgg(pk: PKM) -> Bool {
        return if self.context != pk.context {
            false
        } else if self.ID32 != pk.ID32 {
            false
        } else if self.gender != pk.originalTrainerGender {
            false
        } else if self.version != pk.version {
            if let pk9 = pk as? PK9, pk9.version == .AnyGame {
                true
            } else {
                false
            }
        } else if self.OT != pk.originalTrainerName {
            false
        } else {
            true
        }
    }

    /// Checks if the Trainer Info matches the PKM's original trainer data
    func isFromTrainer(pk: PKM) -> Bool {
        return if pk.isEgg {
            self.isFromTrainer(pk: pk)
        } else if !self.isFromTrainerNoVersion(pk: pk) {
            false
        } else {
            self.isMatchVersion(pk: pk)
        }
    }
}
