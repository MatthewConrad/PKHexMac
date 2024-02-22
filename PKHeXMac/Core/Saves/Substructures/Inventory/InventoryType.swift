//
//  InventoryType.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/20/24.
//

import Foundation

/// Type of items the `InventoryPouch` contains.
/// - remark: used by the Inventory Editor as the index for sprite lookup
enum InventoryType {
    case None,
         Items,
         KeyItems,
         TMHMs,
         Medicine,
         Berries,
         Balls,
         BattleItems,
         MailItems,
         PCItems,
         FreeSpace,
         ZCrystals,
         Candy,
         Treasure,
         Ingredients
    
}
