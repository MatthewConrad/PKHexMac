//
//  TechRecord.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/18/24.
//

import Foundation

protocol PermitRecord {
    /// Maximuim count of record flags that are available.
    var recordCountTotal: Int { get }

    /// Maximum count of record flags that are used.
    var recordCountUsed: Int { get }

    /// Inidividually accessed move IDs that a given record remembers.
    var recordPermitIndexes: [UInt16] { get }

    /// Individually accessed indexes indicate if they can be learned.
    func isRecordPermitted(index: Int) -> Bool
}

/// Exposes info about the Technical Machine / Record (TM / TR) compatibility and history.
/// - remark: Formerly `ITechRecord`
protocol TechRecordTeachable {
    /// Rules for permitting the given record.
    var permit: PermitRecord { get }

    /// Indicates if the TR has been previously used on this entity to learn the move.
    func getMoveRecordFlag(index: Int) -> Bool

    /// Sets the flag indicating that the TR has been learned.
    mutating func setMoveRecordFlag(index: Int, value: Bool)

    /// Indicates if any move has been learned via TR
    func getMoveRecordFlagAny() -> Bool
}
