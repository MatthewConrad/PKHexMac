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
    
    private static let maxMemoryIDXY = 64
    private static let maxMemoryIDAO = 69
    static let maxIntensity: UInt8 = 7
    
    private init() {}
    static let instance = MemoryContext6()
    
    func getCanBeCaptured(species: Species, flags: [UInt8]) -> Bool {
        let offset: Int = species.rawValue >> 3
        if offset >= flags.count {
            return false
        }
        
        let bitIndex = species.rawValue & 7
        return (flags[offset] & (1 << bitIndex)) != 0
    }
    
    func getCanBeCaptured(species: Species, version: GameVersion) -> Bool {
        let capturableAS = getCanBeCaptured(species: species, flags: MemoryContext6Data.captureFlagsAS)
        let capturableOR = getCanBeCaptured(species: species, flags: MemoryContext6Data.captureFlagsOR)
        let capturableX = getCanBeCaptured(species: species, flags: MemoryContext6Data.captureFlagsX)
        let capturableY = getCanBeCaptured(species: species, flags: MemoryContext6Data.captureFlagsY)
        
        switch version {
        case .AnyGame:
            return capturableAS || capturableOR || capturableX || capturableY
        case .X:
            return capturableX
        case .Y:
            return capturableY
        case .AS:
            return capturableAS
        case .OR:
            return capturableOR
        default:
            return false
        }
    }
   
    func getMemoryItemParams() -> Set<UInt16> {
        var itemSet = Set(Legal.heldItemsAO)
        itemSet.insert(MemoryContext6Data.keyItemUsableObserveEonFlute)
        
        for item in MemoryContext6Data.keyItemMemoryArgsAnySpecies {
            itemSet.insert(item)
        }
        
        for tm in ItemStorage6.pouchTMHMORAS.prefix(100) {
            itemSet.insert(tm)
        }
        
        return itemSet
    }
    
    func canUseItemGeneric(item: Int) -> Bool {
        // Key item usage while in party on another species
        return if item == Int(MemoryContext6Data.keyItemUsableObserveEonFlute) {
            true
        } else if MemoryContext6Data.keyItemMemoryArgsAnySpecies.contains(UInt16(item)) {
            true
        } else {
            true // TODO:
        }
    }
    
    func canBuyItem(item: Int, version: GameVersion) -> Bool {
        let purchaseableAO = MemoryContext6Data.purchaseableItemAO.contains(UInt16(item))
        let purchaseableXY = MemoryContext6Data.purchaseableItemXY.contains(UInt16(item))
        
        return if version == .AnyGame {
            purchaseableAO || purchaseableXY
        } else if [.X, .Y].contains(version) {
            purchaseableXY
        } else if [.AS, .OR].contains(version) {
            purchaseableAO
        } else {
            false
        }
    }
    
    func canWinLotoID(item: Int) -> Bool {
        item < UInt8.max && MemoryContext6Data.lotoPrizeXYAO.contains(UInt16(item))
    }
    
    func canPlantBerry(item: Int) -> Bool {
        ItemStorage6.pouchBerries.contains(UInt16(item))
    }
    
    func canHoldItem(item: Int) -> Bool {
        Legal.heldItemsAO.contains(UInt16(item))
    }
    
    func isUsedKeyItemUnspecific(item: Int) -> Bool {
        item == MemoryContext6Data.keyItemUsableObserveEonFlute
    }
    
    func isUsedKeyItemSpecific(item: Int, species: Species) -> Bool {
        MemoryContext6Data.isKeyItemMemoryArgValid(species: species, arg: UInt16(item))
    }
    
    func canObtainMemoryAO(memory: UInt8) -> Bool {
        memory <= MemoryContext6.maxMemoryIDAO && !MemoryContext6Data.memoryNotAO.contains(memory)
    }
    
    func canObtainMemoryXY(memory: UInt8) -> Bool {
        memory <= MemoryContext6.maxMemoryIDXY && !MemoryContext6Data.memoryNotXY.contains(memory)
    }
    
    func canObtainMemory(memory: UInt8) -> Bool {
        memory < MemoryContext6.maxMemoryIDAO
    }
    
    func canObtainMemoryOT(version: GameVersion, memory: UInt8) -> Bool {
        return if [.X, .Y].contains(version) {
            canObtainMemoryXY(memory: memory)
        } else if [.OR, .AS].contains(version) {
            canObtainMemoryAO(memory: memory)
        } else {
            false
        }
    }
    
    func canObtainMemoryHT(version: GameVersion, memory: UInt8) -> Bool {
        canObtainMemory(memory: memory)
    }
    
    func getPokeCenterLocations(version: GameVersion) -> [UInt8] {
        GameVersion.XY.contains(game: version) ? MemoryContext6Data.locationsWithPokeCenterXY :
            MemoryContext6Data.locationsWithPokeCenterAO
    }
    
    func getHasPokeCenterLocation(version: GameVersion, loc: UInt16) -> Bool {
        return if version == .AnyGame {
            getHasPokeCenterLocation(version: .X, loc: loc) || getHasPokeCenterLocation(version: .AS, loc: loc)
        } else if loc > UInt8.max {
            false
        } else {
            getPokeCenterLocations(version: version).contains(UInt8(loc))
        }
    }
    
    func hasPokeCenter(vrsion: GameVersion, location: UInt16) -> Bool {
        location == 9
    }
    
    func isInvalidGeneralLocationMemoryValue(memory: UInt8, variable: UInt16, encounter: Any, pk: PKMProtocol) -> Bool {
        false // TODO:
    }
    
    func isInvalidMiscMemory(memory: UInt8, variable: UInt16) -> Bool {
        false // TODO:
    }
    
    func canHaveIntensity(memory: UInt8, intensity: UInt8) -> Bool {
        return if intensity > MemoryContext6.maxIntensity {
            false
        } else if memory >= MemoryContext6Data.memoryFeelings.count {
            false
        } else {
            MemoryContext6Data.memoryMinIntensity[Int(memory)] <= intensity
        }
    }
    
    func canHaveFeeling(memory: UInt8, feeling: UInt8, argument: UInt16) -> Bool {
        return if memory >= MemoryContext6Data.memoryFeelings.count {
            false
        } else if memory == 4 && argument == 0 {
            feeling < 10
        } else {
            (MemoryContext6Data.memoryFeelings[Int(memory)] & (1 << feeling)) != 0
        }
    }
    
    func getMinimumIntensity(memory: UInt8) -> Int {
        return if memory >= MemoryContext6Data.memoryMinIntensity.count {
            0
        } else {
            Int(MemoryContext6Data.memoryMinIntensity[Int(memory)])
        }
    }
    
    func getMemoryRarity(memory: UInt8) -> Int {
        memory >= MemoryContext6Data.memoryRandChance.count ? -1 : Int(MemoryContext6Data.memoryRandChance[Int(memory)])
    }
}
