//
//  TrainerID32.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

// 16-bit Trainer ID
protocol TrainerID16: TrainerID {
    var TID16: Int { get set }
}

// Object stores a numerical trainer ID
protocol TrainerID32: TrainerID16 {
    // 32-bit trainer ID (0-4,294,967,295)
    var ID32: UInt { get set }
    // 16-bit secret id (0-65535
    var SID16: Int { get set }
}

extension TrainerID32 {
    func getTrainerTID7() -> UInt {
        return ID32 % 1000000
    }

    func getTrainerSIDE7() -> UInt {
        return ID32 / 1000000
    }

    mutating func setTrainerTID7(value: UInt) {
        ID32 = ((ID32 / 1000000) * 1000000) + value
    }

    mutating func setTrainerSID7(value: UInt) {
        ID32 = (value * 1000000) + (ID32 % 1000000)
    }

    mutating func setTrainerID16(tid16: UInt, sid16: UInt) {
        ID32 = (sid16 << 16) | tid16
    }

    mutating func setTrainerID7(tid7: UInt, sid7: UInt) {
        ID32 = (sid7 * 1000000) + tid7
    }

    mutating func setDisplayID(tid: UInt, sid: UInt) {
        if TrainerIDDisplayFormat == TrainerIDFormat.SixDigit {
            // setTrainerID7(tid,sid)
            ID32 = (sid * 1000000) + tid
        } else {
            // setTrainerID16(tid, sid)
            ID32 = (sid << 16) | tid
        }
    }

    func getShinyXor(pid: UInt) -> Int {
        let pidXor = pid>>16 ^ pid&0xFFFF
        return Int(pidXor) ^ SID16 ^ TID16
    }

    func isShiny(pid: UInt, gen: Int = 7) -> Bool {
        let pidXor = pid>>16 ^ pid&0xFFFF
        let xor = Int(pidXor) ^ SID16 ^ TID16

        let threshold = gen >= 7 ? 16 : 8

        return xor < threshold
    }
}
