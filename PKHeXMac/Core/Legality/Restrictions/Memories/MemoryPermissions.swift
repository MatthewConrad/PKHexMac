//
//  MemoryPermissions.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/18/24.
//

import Foundation

/// Validation logic for specific memory conditions.
enum MemoryPermissions {
    static func isMemoryOfKnownMove(memory: Int) -> Bool {
        [48, 80, 81].contains(memory)
    }
    
    static func canWinLotoID(context: EntityContext, item: Int) -> Bool {
        Memories.getContext(context: context).canWinLotoID(item: item)
    }
    
    static func canHoldItem(context: EntityContext, item: Int) -> Bool {
        Memories.getContext(context: context).canHoldItem(item: item)
    }
    
    static func canPlantBerry(context: EntityContext, item: Int) -> Bool {
        Memories.getContext(context: context).canPlantBerry(item: item)
    }
    
    static func canUseItemGeneric(context: EntityContext, item: Int) -> Bool {
        Memories.getContext(context: context).canUseItemGeneric(item: item)
    }
    
    static func isUsedKeyItemUnspecific(context: EntityContext, item: Int) -> Bool {
        Memories.getContext(context: context).isUsedKeyItemUnspecific(item: item)
    }
    
    static func isUsedKeyItemSpecific(context: EntityContext, item: Int, species: Species) -> Bool {
        Memories.getContext(context: context).isUsedKeyItemSpecific(item: item, species: species)
    }
    
    static func canUseItem(context: EntityContext, item: Int, species: Species) -> Bool {
        return if isUsedKeyItemUnspecific(context: context, item: item) {
            true
        } else if isUsedKeyItemSpecific(context: context, item: item, species: species) {
            true
        } else {
            true // TODO:
        }
    }
    
    static func canBuyItem(context: EntityContext, item: Int, version: GameVersion = GameVersion.AnyGame) -> Bool {
        Memories.getContext(context: context).canBuyItem(item: item, version: version)
    }
    
    // TODO: everything past canKnowMove
}
