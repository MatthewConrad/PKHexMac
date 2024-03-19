//
//  MoveShop8.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/18/24.
//

import Foundation

/// Exposes info about the Move Shop in PLA
protocol MoveShop8 {
    var permit: PermitRecord { get }

    /// Indicates if the move shop offering has been purchased.
    func getPurchasedRecordFlag(index: Int) -> Bool

    /// Sets the flag indicating the move shop offering has been purchased.
    mutating func setPurchasedRecordFlag(index: Int, value: Bool)

    /// Indicates if any move has been purchased from the move shop.
    func getPurchasedRecordFlagAny() -> Bool

    /// Gets a count of move shop flags present in the entity.
    func getPurchasedCount() -> Int
}

protocol MoveShop8Mastery: MoveShop8 {
    /// Indicates if the move shop offering has been mastered.
    func getMasteredRecordFlag(index: Int) -> Bool
    
    /// Sets the flag indicating the move shop offering has been mastered.
    mutating func setMasteredRecordFlag(index: Int, value: Bool)
    
    /// Indicates if any move has been flagged as mastered.
    func getMasteredRecordFlagAny() -> Bool
}

// TODO: implement extension after Learnset implemented
