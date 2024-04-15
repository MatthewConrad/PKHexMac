//
//  IndividualValueSet.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Used by `IndividualValueSet` to indicate if a value is present.
enum IndividualValueSetType: UInt8 {
    case unspecified = 0,
         specified = 1
}

/// Stores an IV template
struct IndividualValueSet {
    let HP: Int8
    let ATK: Int8
    let DEF: Int8
    let SPE: Int8
    let SPA: Int8
    let SPD: Int8
    let type: IndividualValueSetType

    /// - remark: for stat params, -1 indicates "random"
    init(HP: Int8, ATK: Int8, DEF: Int8, SPE: Int8, SPA: Int8, SPD: Int8, type: IndividualValueSetType = .specified) {
        self.HP = HP
        self.ATK = ATK
        self.DEF = DEF
        self.SPE = SPE
        self.SPA = SPA
        self.SPD = SPD
        self.type = type
    }

    var isSpecified: Bool {
        type != .unspecified
    }

    subscript(index: Int) -> Int8 {
        switch index {
            case 0: return HP
            case 1: return ATK
            case 2: return DEF
            case 3: return SPE
            case 4: return SPA
            case 5: return SPD
            default: fatalError("Index out of range")
        }
    }

    func copyToSpeedLast(_ span: inout [Int]) {
        span[5] = Int(SPE)
        span[4] = Int(SPD)
        span[3] = Int(SPA)
        span[2] = Int(DEF)
        span[1] = Int(ATK)
        span[0] = Int(HP)
    }
}
