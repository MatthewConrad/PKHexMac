//
//  MemoryContext.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/10/24.
//

import Foundation

protocol MemoryContext {
    var context: EntityContext { get }

    func getMemoryItemParams() -> Set<UInt16>

    func canUseItemGeneric(item: Int) -> Bool
    func canBuyItem(item: Int, version: GameVersion) -> Bool
    func canWinLotoID(item: Int) -> Bool
    func canPlantBerry(item: Int) -> Bool
    func canHoldItem(item: Int) -> Bool

    func isUsedKeyItemUnspecific(item: Int) -> Bool
    func isUsedKeyItemSpecific(item: Int, species: Species) -> Bool

    func canObtainMemory(memory: UInt8) -> Bool
    func canObtainMemoryOT(version: GameVersion, memory: UInt8) -> Bool
    func canObtainMemoryHT(version: GameVersion, memory: UInt8) -> Bool

    func hasPokeCenter(vrsion: GameVersion, location: UInt16) -> Bool

    // TODO: replace Any with EncounterTemplate
    func isInvalidGeneralLocationMemoryValue(memory: UInt8, variable: UInt16, encounter: Any, pk: PKMProtocol) -> Bool

    func isInvalidMiscMemory(memory: UInt8, variable: UInt16) -> Bool

    func canHaveIntensity(memory: UInt8, intensity: UInt8) -> Bool
    func canHaveFeeling(memory: UInt8, feeling: UInt8, argument: UInt16) -> Bool
    func getMinimumIntensity(memory: UInt8) -> Int
}
