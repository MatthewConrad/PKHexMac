//
//  MemoryContext8.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/10/24.
//

import Foundation

struct MemoryContext8: MemoryContext {
    var context: EntityContext {
        .Gen8
    }
    
    private static let maxMemoryIDSWSH = 89
    static let maxIntensity: UInt8 = 7
    
    private init() {}
    static let instance = MemoryContext8()
    
    static func getCanBeCaptured(species: Species, version: GameVersion) -> Bool {
        let capturableSW = MemoryContext6.getCanBeCaptured(species: species, flags: MemoryContext8Data.captureFlagsSW)
        let capturableSH = MemoryContext6.getCanBeCaptured(species: species, flags: MemoryContext8Data.captureFlagsSH)
        
        switch version {
        case .AnyGame:
            return capturableSW || capturableSH
        case .SW:
            return capturableSW
        case .SH:
            return capturableSH
        default:
            return false
        }
    }
    
    func getMemoryItemParams() -> Set<UInt16> {
        var itemSet = Set(Legal.heldItemsSWSH)
        itemSet.formUnion(Legal.heldItemsAO)
        
        for item in MemoryContext8Data.keyItemMemoryArgsAnySpecies {
            itemSet.insert(item)
        }
        
        for tm in ItemStorage6.pouchTMHMORAS.prefix(100) {
            itemSet.insert(tm)
        }
        
        return itemSet
    }
    
    func canUseItemGeneric(item: Int) -> Bool {
        true // TODO:
    }
    
    func canBuyItem(item: Int, version: GameVersion) -> Bool {
        switch item {
        case 1085:
            return [.AnyGame, .SW].contains(version)
        case 1086:
            return [.AnyGame, .SH].contains(version)
        default:
            return ItemStorage8SWSH.isTechRecord(itemID: UInt16(item)) || MemoryContext8Data.purchaseItemsNoTR.contains(UInt16(item))
        }
    }
    
    func canWinLotoID(item: Int) -> Bool {
        item < UInt8.max && MemoryContext8Data.lotoPrizeSWSH.contains(UInt8(item))
    }
    
    func canPlantBerry(item: Int) -> Bool {
        false
    }
    
    func canHoldItem(item: Int) -> Bool {
        Legal.heldItemsSWSH.contains(UInt16(item))
    }
    
    func isUsedKeyItemUnspecific(item: Int) -> Bool {
        false
    }
    
    func isUsedKeyItemSpecific(item: Int, species: Species) -> Bool {
        MemoryContext8Data.isKeyItemMemoryArgValid(species: species, arg: UInt16(item))
    }
    
    func canObtainMemorySWSH(memory: UInt8) -> Bool {
        memory <= MemoryContext8.maxMemoryIDSWSH && !MemoryContext8Data.memoryNotSWSH.contains(memory)
    }
    
    func canObtainMemory(memory: UInt8) -> Bool {
        canObtainMemorySWSH(memory: memory)
    }
    
    func canObtainMemoryOT(version: GameVersion, memory: UInt8) -> Bool {
        switch version {
        case .SW, .SH:
            return canObtainMemorySWSH(memory: memory)
        default:
            return memory == 0
        }
    }
    
    func canObtainMemoryHT(version: GameVersion, memory: UInt8) -> Bool {
        canObtainMemorySWSH(memory: memory)
    }
    
    func hasPokeCenter(vrsion: GameVersion, location: UInt16) -> Bool {
        location == 9
    }
    
    // TODO: implement after EncounterTemplate
    static func isWildEncounterMeet(pk: PKMProtocol, encounter: Any) -> Bool {
        true
    }
    
    // TODO: implement after EncounterTemplate
    static func isWildEncounter(pk: PKMProtocol, encounter: Any) -> Bool {
        true
    }
    
    // TODO: implement after EncounterTemplate
    static func isCurryEncounter(pk: PKMProtocol, encounter: Any) -> Bool {
        true
    }
    
    // TODO: update with proper EncounterTable type
    func isInvalidGenLoc8(memory: UInt8, location: UInt16, egg: Int, variable: UInt16, pk: PKMProtocol, encounter: Any) -> Bool {
        true
    }
    
    func isInvalidGenLoc8Other(memory: UInt8, variable: UInt16) -> Bool {
        if variable > UInt8.max {
            return true
        }
        
        let arg = UInt8(variable)
        switch memory {
        // {0} became {1}’s friend when it came through Link Trade {2}. {4} that {3}.
        case 4 where !MemoryContext8Data.isGeneralLocation8(location: arg) || arg == 79:
            return true
        
        // {0} rode a bike with {1} {2}. {4} that {3}.
        case 32 where ![1, 8, 12, 22, 33, 35, 37, 40, 41, 44, 47, 48, 49, 50, 51, 53, 65, 71, 72, 75, 76, 77, 78].contains(arg):
            return true

        // {0} saw {1} secretly picking up something {2}. {4} that {3}.
        case 39 where ![8, 12, 22, 33, 35, 37, 40, 41, 44, 47, 48, 49, 50, 51, 53, 65, 71, 72, 75, 76, 77].contains(arg):
            return true

        // {0} checked the sign with {1} {2}. {4} that {3}.
        case 42 where ![1, 8, 12, 22, 33, 35, 37, 44, 47, 53, 71, 72, 76, 77].contains(arg):
            return true

        // {0} sat with {1} on a bench {2}. {4} that {3}.
        case 70 where ![8, 12, 22, 28, 33, 35, 37, 38, 44, 53, 77].contains(arg):
            return true
            
        default:
            return !MemoryContext8Data.isGeneralLocation8(location: arg)
        }
    }
    
    func isInvalidGeneralLocationMemoryValue(memory: UInt8, variable: UInt16, encounter: Any, pk: PKMProtocol) -> Bool {
        let type = Memories.getMemoryArgType(memory: memory, memoryGen: 8)
        
        return if type != .GeneralLocation {
            false
        } else if [1, 2, 3].contains(memory) {
            isInvalidGenLoc8(memory: memory, location: pk.metLocation, egg: Int(pk.eggLocation), variable: variable, pk: pk, encounter: encounter)
        } else {
            isInvalidGenLoc8Other(memory: memory, variable: variable)
        }
    }
    
    func isInvalidMiscMemory(memory: UInt8, variable: UInt16) -> Bool {
        switch memory {
        // {0} encountered {2} when it was with {1}. {4} that {3}.
        case 29 where ![888, 889, 890, 898].contains(variable):
            // invalid for Zacian, Zamazenta, Eternatus, Calyrex
            return true
        default:
            return false
        }
    }
    
    static func getRandomFeeling(memory: Int, max: Int = 24) -> UInt8 {
        let bits = MemoryContext8Data.memoryFeelings[memory]
        repeat {
            let feel = Int.random(in: 0 ..< max)
            if (bits & (1 << feel)) != 0 {
                return UInt8(feel + 1)
            }
        } while true
    }
    
    func canHaveIntensity(memory: UInt8, intensity: UInt8) -> Bool {
        return if intensity > MemoryContext8.maxIntensity {
            false
        } else if memory >= MemoryContext8Data.memoryFeelings.count {
            false
        } else {
            MemoryContext8Data.memoryMinIntensity[Int(memory)] <= intensity
        }
    }
    
    func canHaveFeeling(memory: UInt8, feeling: UInt8, argument: UInt16) -> Bool {
        return if memory >= MemoryContext8Data.memoryFeelings.count {
            false
        } else if feeling == 0 {
            false
        } else {
            (MemoryContext8Data.memoryFeelings[Int(memory)] & (1 << (feeling - 1))) != 0
        }
    }
    
    func getMinimumIntensity(memory: UInt8) -> Int {
        return if memory >= MemoryContext8Data.memoryFeelings.count {
            0
        } else {
            Int(MemoryContext8Data.memoryMinIntensity[Int(memory)])
        }
    }
}
