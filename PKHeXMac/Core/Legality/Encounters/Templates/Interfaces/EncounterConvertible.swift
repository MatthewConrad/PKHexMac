//
//  EncounterConvertible.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/15/24.
//

import Foundation

/// Exposes conversion methods to create a `PKM` from the object's data
protocol EncounterConvertible {
    /// Creates a `PKM` from the template, using the input trainer data.
    func convertToPKM(trainer: TrainerInfo) -> PKMProtocol

    /// Creates a `PKM` from the template, using the input trainer data.
    /// The generation routine will try to yield a result that matches the specs in the `criteria`.
    func convertToPKM(trainer: TrainerInfo, criteria: EncounterCriteria) -> PKMProtocol
}
