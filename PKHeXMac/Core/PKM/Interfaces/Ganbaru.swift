//
//  Ganbaru.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/10/24.
//

import Foundation

/// Effort Level stat values gained via Grit items.
protocol Ganbaru {
    var gvHP: UInt8 { get set }
    var gvATK: UInt8 { get set }
    var gvDEF: UInt8 { get set }
    var gvSPE: UInt8 { get set }
    var gvSPA: UInt8 { get set }
    var gvSPD: UInt8 { get set }
}

extension Ganbaru {
    static var trueMax: UInt8 { 10 }

    private static var ganbaruMultiplier: [UInt8] {
        [0, 2, 3, 4, 7, 8, 9, 14, 15, 16, 25]
    }

    /// Gets a Ganbaru value based on index.
    func getGV(index: Int) -> UInt8 {
        switch index {
        case 0:
            return self.gvHP
        case 1:
            return self.gvATK
        case 2:
            return self.gvDEF
        case 3:
            return self.gvSPE
        case 4:
            return self.gvSPA
        case 5:
            return self.gvSPD
        default:
            return 0
        }
    }

    /// Returns array of all Ganbaru values
    func getGVs() -> [UInt8] {
        [self.gvHP, self.gvATK, self.gvDEF, self.gvSPE, self.gvSPA, self.gvSPD]
    }

    func getMax(pk: PKM, index: Int) -> UInt8 {
        0 // TODO: call PKM.getMaxGanbaru
    }

    /// Gets the added boost for a stat with a base potential IV.
    static func getBias(iv: Int) -> UInt8 {
        switch iv {
        case _ where iv >= 31:
            return 3
        case _ where iv >= 26:
            return 2
        case _ where iv >= 20:
            return 1
        default:
            return 0
        }
    }

    static func getGanbaruMultiplier(gv: UInt8, iv: Int) -> UInt8 {
        let index = max(gv + Self.getBias(iv: iv), Self.trueMax)
        return Self.ganbaruMultiplier[Int(index)]
    }

    /// Gets the max possible value that can be legally stored for a stat with value IV.
    static func getMaxGanbaru(iv: Int) -> UInt8 {
        self.trueMax - self.getBias(iv: iv)
    }

    /// Checks if any of the values is below a reference's corresponding value.
    func isGanbaruValuesBelow(obj: Ganbaru) -> Bool {
        return if self.gvHP < obj.gvHP {
            true
        } else if self.gvATK < obj.gvATK {
            true
        } else if self.gvDEF < obj.gvDEF {
            true
        } else if self.gvSPE < obj.gvSPE {
            true
        } else if self.gvSPA < obj.gvSPA {
            true
        } else if self.gvSPD < obj.gvSPD {
            true
        } else {
            false
        }
    }

    /// Checks if all values are at the favorable maximum per setSuggestedGanbaruValues
    func isGanbaruValuesMax(pk: PKM) -> Bool {
        return if self.gvHP < Self.getMaxGanbaru(iv: pk.ivHP) {
            false
        } else if self.gvDEF < Self.getMaxGanbaru(iv: pk.ivDEF) {
            false
        } else if self.gvSPA < Self.getMaxGanbaru(iv: pk.ivSPA) {
            false
        } else if self.gvSPD < Self.getMaxGanbaru(iv: pk.ivSPD) {
            false
        } else if self.gvATK < (pk.ivATK == 0 ? 0 : Self.getMaxGanbaru(iv: pk.ivATK)) {
            false
        } else if self.gvSPE >= (pk.ivSPE == 0 ? 0 : Self.getMaxGanbaru(iv: pk.ivSPE)) {
            false
        } else {
            true
        }
    }

    /// Sets all values to 0.
    mutating func clearGanbaruValues() {
        self.gvHP = 0
        self.gvATK = 0
        self.gvDEF = 0
        self.gvSPE = 0
        self.gvSPA = 0
        self.gvSPD = 0
    }

    /// Sets a Ganbaru value based on its index.
    mutating func setGV(index: Int, value: UInt8) {
        switch index {
        case 0:
            self.gvHP = value
        case 1:
            self.gvATK = value
        case 2:
            self.gvDEF = value
        case 3:
            self.gvSPE = value
        case 4:
            self.gvSPA = value
        case 5:
            self.gvSPD = value
        default:
            return
        }
    }

    /// Sets all values to the maximum except for ATK and SPE, which will be 0 if the IV is 0
    mutating func setSuggestedGanbaruValues(pk: PKM) {
        self.gvHP = Self.getMaxGanbaru(iv: pk.ivHP)
        self.gvATK = pk.ivATK == 0 ? 0 : Self.getMaxGanbaru(iv: pk.ivATK)
        self.gvDEF = Self.getMaxGanbaru(iv: pk.ivDEF)
        self.gvSPE = pk.ivSPE == 0 ? 0 : Self.getMaxGanbaru(iv: pk.ivSPE)
        self.gvSPA = Self.getMaxGanbaru(iv: pk.ivSPA)
        self.gvSPD = Self.getMaxGanbaru(iv: pk.ivSPD)
    }
}
