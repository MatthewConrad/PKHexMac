//
//  MagnetStatic.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/15/24.
//

import Foundation

/// Contains information about the RNG restrictions for the slot, and any mutated RNG values.
/// - remark:
///     When encountering a Wild Pokemon with a lead that has `Ability.Static` or
///     `Ability.MagnetPull`,  the game picks encounters from the `EncounterArea<T>`
///     that match the type.
///     The values in this interface change the `NumberedSlot` to allow different values for slot yielding.
///     Formerly `IMagnetStatic`.
protocol MagnetStatic {
    /// `NumberedSlot.slotNumber` if the lead is `Ability.Static`
    var staticIndex: UInt8 { get }
    
    /// Count of slots in the parent area that can be yielded by `Ability.Static`
    var staticCount: UInt8 { get }
    
    /// Indicates if the slot can be yielded by `Ability.Static`
    var isStaticSlot: Bool { get }
    
    /// `NumberedSlot.slotNumber` if the lead is `Ability.MagnetPull`
    var magnetPullIndex: UInt8 { get }
    
    /// Count of slots in the parent area that can be yielded by `Ability.MagnetPull`
    var magnetPullCount: UInt8 { get }
    
    /// Indicates if the slot can be yielded by `Ability.Magnet Pull`
    var isMagnetPullSlot: Bool { get }
}

extension MagnetStatic {
    var isStaticSlot: Bool {
        self.staticCount != 0
    }
    
    var isMagnetSlot: Bool {
        self.magnetPullCount != 0
    }
    
    /// Checks if the encounter can be an encounter slot chosen via Static or Magnet Pull
    func isSlotValidStaticMagnet(u16SlotRand: UInt, lead: inout LeadRequired) -> Bool {
        if self.isStaticSlot && u16SlotRand % UInt(self.staticCount) == UInt(self.staticIndex) {
            lead = .Static
            return true
        }
        
        // isn't checked for fishing slots, but no fishing slots are steel type -- always false
        if self.isMagnetSlot && u16SlotRand % UInt(self.magnetPullCount) == UInt(self.magnetPullIndex) {
            lead = .MagnetPull
            return true
        }
        
        lead = .None
        return false
    }
}
