//
//  SanityChecksum.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/18/24.
//

import Foundation

/// Unencrypted metadata about the entity to check if the data is not corrupt.
protocol SanityChecksum {
    /// Used to store flags about decryption state and/or integrity of the data range.
    /// - remark: Zero when encryptyed. Dumped decrypted data does not manipulate this property.
    var sanity: UInt16 { get set }

    /// Calculated checksum of the encrypted region, used to check if the data has been manipulated externally.
    /// - remark: Can detect if the data was modified via cheats/programs, as well as cosmic ray bit-flips. Anything with a bad checksum will be flagged in the `sanity` as a bad egg.
    var checksum: UInt16 { get set }
}
