//
//  ItemStorage.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/20/24.
//

import Foundation

/// Exposes permissions about Item Storage (Pouch) Constraints
protocol ItemStorage {

    /// Indicates if the item is actually obtainable for the given `type`.
    /// - remark: This is used to check if the item is legal to obtain, not if the item can exist in the pouch.
    func isLegal(type: InventoryType, itemIndex: Int, itemCount: Int) -> Bool

    /// Gets all possible item IDs that can exist in the given pouch `type`.
    func getItems(type: InventoryType) -> [Int]
}
