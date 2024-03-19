//
//  HandlerUpdatable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/10/24.
//

import Foundation

/// Exposes methods to adapt the entity to the Handling Trainer
protocol HandlerUpdatable {
    func belongsTo(trainer: TrainerInfo) -> Bool
    
    /// Updates the entity to match the TrainerInfo
    mutating func updateHandler(trainer: TrainerInfo)
}
