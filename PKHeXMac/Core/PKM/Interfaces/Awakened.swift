//
//  Awakened.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

/// Exposes information about the stat boots gained when Awakened
/// - remark: used only in LGP/E. Formerly `IAwakened`
protocol Awakenable {
    var avHP: UInt8 { get set }
    var avATK: UInt8 { get set }
    var avDEF: UInt8 { get set }
    var avSPA: UInt8 { get set }
    var avSPD: UInt8 { get set }
    var avSPE: UInt8 { get set }
}

extension Awakenable {
    var awakeningMax: UInt8 { 200 }

    func getAVs() -> [UInt8] {
        [avHP, avATK, avDEF, avSPA, avSPD, avSPE]
    }

    func getAV(index: Int) -> UInt8 {
        let all = getAVs()

        return if (0 ... all.count).contains(index) {
            all[index]
        } else {
            0
        }
    }

    mutating func setAVs(values: [UInt8]) {
        avHP = values[0]
        avATK = values[1]
        avDEF = values[2]
        avSPA = values[3]
        avSPD = values[4]
        avSPE = values[5]
    }

    mutating func setAV(index: Int, value: UInt8) {
        switch index {
        case 0:
            avHP = value
        case 1:
            avATK = value
        case 2:
            avDEF = value
        case 3:
            avSPA = value
        case 4:
            avSPD = value
        case 5:
            avSPE = value
        default:
            return
        }
    }

    mutating func awakeningSetAllTo(value: UInt8) {
        avHP = value
        avATK = value
        avDEF = value
        avSPE = value
        avSPA = value
        avSPD = value
    }

    mutating func awakeningClear() {
        awakeningSetAllTo(value: 0)
    }

    mutating func awakeningMaximize() {
        awakeningSetAllTo(value: awakeningMax)
    }

    func awakeningSum() -> Int {
        Int(avHP + avATK + avDEF + avSPE + avSPA + avSPD)
    }

    func isAwakeningAboveOrEqual(initial: Awakenable) -> Bool {
        let all = getAVs(),
            initialAll = initial.getAVs()

        for index in 0 ..< all.count {
            if all[index] < initialAll[index] {
                return false
            }
        }

        return true
    }

    func isAwakeningBelow(initial: Awakenable) -> Bool {
        !isAwakeningAboveOrEqual(initial: initial)
    }

    // TODO: finish me after PB7
}
