//
//  MemoryVariableSet.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/18/24.
//

import Foundation

/// Small wrapper to store details about a memory so that it can be passed to verification.
/// - parameters:
///     - handler: Trainer who originated the memory
///     - memoryID: the memory ID
///     - variable: argument for the memory
///     - intensity: how strongly they remember the memory
///     - feeling: how they feel about the memory
struct MemoryVariableSet {
    let handler: String
    let memoryID: UInt8
    let variable: UInt16
    let intensity: UInt8
    let feeling: UInt8

    static func read(pk: TrainerMemorable, handler: Int) -> MemoryVariableSet {
        switch handler {
        case 0:
            return MemoryVariableSet(handler: LegalityCheckStrings.xOT, memoryID: pk.originalTrainerMemory, variable: pk.originalTrainerMemoryVariable, intensity: pk.originalTrainerMemoryIntensity, feeling: pk.originalTrainerMemoryFeeling)

        case 1:
            return MemoryVariableSet(handler: LegalityCheckStrings.xHT, memoryID: pk.handlingTrainerMemory, variable: pk.handlingTrainerMemoryVariable, intensity: pk.handlingTrainerMemoryIntensity, feeling: pk.handlingTrainerMemoryFeeling)
        default:
            return MemoryVariableSet(handler: LegalityCheckStrings.xOT, memoryID: 0, variable: 0, intensity: 0, feeling: 0)
        }
    }
}
