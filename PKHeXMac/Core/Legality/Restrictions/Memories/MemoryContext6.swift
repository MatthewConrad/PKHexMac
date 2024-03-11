//
//  MemoryContext6.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/10/24.
//

import Foundation

struct MemoryContext6: MemoryContext {
    var context: EntityContext {
        .Gen6
    }
    
    private static let MAX_MEMORY_ID_XY = 64
    private static let MAX_MEMORY_ID_AO = 69
    
    private init() {}
    static let instance = MemoryContext6()
   
    func getMemoryItemParams() -> Set<UInt16> {
        <#code#>
    }
    
    func canUseItemGeneric(item: Int) -> Bool {
        <#code#>
    }
    
    func canBuyItem(item: Int, version: GameVersion) -> Bool {
        <#code#>
    }
    
    func canWinLotoID(item: Int) -> Bool {
        <#code#>
    }
    
    func canPlantBerry(item: Int) -> Bool {
        <#code#>
    }
    
    func canHoldItem(item: Int) -> Bool {
        <#code#>
    }
    
    func isUsedKeyItemUnspecific(item: Int) -> Bool {
        <#code#>
    }
    
    func isUsedKeyItemSpecific(item: Int) -> Bool {
        <#code#>
    }
    
    func canObtainMemory(memory: UInt8) -> Bool {
        <#code#>
    }
    
    func canObtainMemoryOT(version: GameVersion, memory: UInt8) -> Bool {
        <#code#>
    }
    
    func canObtainMemoryHT(version: GameVersion, memory: UInt8) -> Bool {
        <#code#>
    }
    
    func hasPokeCenter(vrsion: GameVersion, location: UInt16) -> Bool {
        <#code#>
    }
    
    func isInvalidGeneralLocationMemoryValue(memory: UInt8, variable: UInt16, encounter: Any, pk: PKMProtocol) -> Bool {
        <#code#>
    }
    
    func isInvalidMiscMemory(memory: UInt8, variable: UInt16) -> Bool {
        <#code#>
    }
    
    func canHaveIntensity(memory: UInt8, intensity: UInt8) -> Bool {
        <#code#>
    }
    
    func canHaveFeeling(memory: UInt8, feeling: UInt8, argument: UInt16) -> Bool {
        <#code#>
    }
    
    func getMinimumIntensity(memory: UInt8) -> Int {
        <#code#>
    }
}
