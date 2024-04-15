//
//  FixedTrainer.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Contains information about initial Trainer Details
/// - remark: formerly `IFixedTrainer`
protocol FixedTrainer {
    /// Indicates if the Trainer Name / details are specified by the encounter template.
    var isFixedTrainer: Bool { get }
    
    /// Checks if the specified Trainer name / details matches the encounter template
    func isTrainerMatch(pk: PKMProtocol, trainer: String, language: Int) -> Bool
}
