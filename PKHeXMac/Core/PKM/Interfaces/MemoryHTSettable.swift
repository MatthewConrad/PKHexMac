//
//  MemoryHTSettable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/18/24.
//

import Foundation

protocol MemoryHTSettable {
    var handlingTrainerMemory: UInt8 { get set }
    var handlingTrainerMemoryIntensity: UInt8 { get set }
    var handlingTrainerMemoryFeeling: UInt8 { get set }
    var handlingTrainerMemoryVariable: UInt16 { get set }
}

extension MemoryHTSettable {
    /// Sets a Link Trade memory to the handling trainer.
    mutating func setTradeMemoryHT6(bank: Bool) {
        // Link trade to [VAR: General Location]
        self.handlingTrainerMemory = 4

        self.handlingTrainerMemoryIntensity = 1

        // 0-9 Bank, 0-19 Trade
        self.handlingTrainerMemoryFeeling = MemoryContext6.getRandomFeeling(memory: 4, max: bank ? 10 : 20)

        // Somewhere (Bank) : Pokecenter (Trade)
        self.handlingTrainerMemoryVariable = bank ? 0 : 9
    }

    /// Sets a Link Trade memory to the handling trainer.
    mutating func setTradeMemoryHT8(bank: Bool) {
        // Link trade to [VAR: General Location]
        self.handlingTrainerMemory = 4

        self.handlingTrainerMemoryIntensity = 1

        // 0-19 Trade
        self.handlingTrainerMemoryFeeling = MemoryContext6.getRandomFeeling(memory: 4, max: 20)

        // Pokecenter (Trade)
        self.handlingTrainerMemoryVariable = 9
    }

    /// Sets all values to zero.
    mutating func clearMemoriesHT() {
        self.handlingTrainerMemory = 0
        self.handlingTrainerMemoryIntensity = 0
        self.handlingTrainerMemoryFeeling = 0
        self.handlingTrainerMemoryVariable = 0
    }
}
