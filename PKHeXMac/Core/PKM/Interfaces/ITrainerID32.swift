//
//  ITrainerID32.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

// 16-bit Trainer ID
protocol ITrainerID16: ITrainerID {
    var TID16: Int { get set }
}

// Object stores a numerical trainer ID
protocol ITrainerID32: ITrainerID16 {
    // 32-bit trainer ID (0-4,294,967,295)
    var ID32: UInt32 { get set }
    // 16-bit secret id (0-65535
    var SID16: Int { get set }
}

extension ITrainerID32 {
    func getTrainerTID7() -> UInt32 {
        return ID32 % 1000000
    }

    func getTrainerSIDE7() -> UInt32 {
        return ID32 / 1000000
    }

    mutating func setTrainerTID7(value: UInt32) {
        ID32 = ((ID32 / 1000000) * 1000000) + value
    }

    mutating func setTrainerSID7(value: UInt32) {
        ID32 = (value * 1000000) + (ID32 % 1000000)
    }

    mutating func setTrainerID16(tid16: UInt32, sid16: UInt32) {
        ID32 = (sid16 << 16) | tid16
    }

    mutating func setTrainerID7(tid7: UInt32, sid7: UInt32) {
        ID32 = (sid7 * 1000000) + tid7
    }

    mutating func setDisplayID(tid: UInt32, sid: UInt32) {
        if TrainerIDDisplayFormat == TrainerIDFormat.SixDigit {
            // setTrainerID7(tid,sid)
            ID32 = (sid * 1000000) + tid
        } else {
            // setTrainerID16(tid, sid)
            ID32 = (sid << 16) | tid
        }
    }

    func getShinyXor(pid: UInt32) -> Int {
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
