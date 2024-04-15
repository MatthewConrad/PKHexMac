//
//  LevelRange.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Contains information about the level range the object originates with.
/// - remark: formerly `ILevelRange`
protocol LevelRange {
    var levelMin: UInt8 { get }
    var levelMax: UInt8 { get }
}

extension LevelRange {
    func isFixedLevel() -> Bool {
        self.levelMin == self.levelMax
    }

    func isRandomLevel() -> Bool {
        self.levelMin != self.levelMax
    }

    func isLevelWithinRange(lvl: UInt8) -> Bool {
        (self.levelMin ... self.levelMax).contains(lvl)
    }

    func isLevelWithinRange(lvl: Int) -> Bool {
        self.isLevelWithinRange(lvl: UInt8(lvl))
    }

    func isLevelWithinRange(lvl: Int, minDecrease: Int, maxIncrease: Int) -> Bool {
        (self.levelMin - UInt8(minDecrease) ... self.levelMax + UInt8(maxIncrease)).contains(UInt8(lvl))
    }

    func isLevelWithinRange(min: UInt8, max: UInt8, minDecrease: Int, maxIncrease: Int) -> Bool {
        self.levelMin - UInt8(minDecrease) <= max && min <= self.levelMax + UInt8(maxIncrease)
    }

    static func isLevelWithinRange(lvl: Int, min: Int, max: Int) -> Bool {
        (min ... max).contains(lvl)
    }
}

struct SingleLevelRange: LevelRange {
    var levelMin: UInt8
    var levelMax: UInt8

    init(level: UInt8) {
        self.levelMax = level
        self.levelMax = level
    }
}
