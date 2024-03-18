//
//  MemoryOTSettable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/18/24.
//

import Foundation

protocol MemoryOTSettable: MemoryOTReadable {
    var originalTrainerMemory: UInt8 { get set }
    var originalTrainerMemoryIntensity: UInt8 { get set }
    var originalTrainerMemoryFeeling: UInt8 { get set }
    var originalTrainerMemoryVariable: UInt16 { get set }
}

extension MemoryOTSettable {
    /// Sets all values to zero.
    mutating func clearMemoriesOT() {
        self.originalTrainerMemory = 0
        self.originalTrainerMemoryIntensity = 0
        self.originalTrainerMemoryFeeling = 0
        self.originalTrainerMemoryVariable = 0
    }
}
