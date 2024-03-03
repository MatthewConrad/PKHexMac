//
//  PersonalEncounter.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

/// Exposes info about encounter details for an entity
protocol PersonalEncounter {
    var baseEXP: Int { get set }
    var hatchCycles: Int { get set }
    var catchRate: Int { get set }
    var baseFriendship: Int { get set }
    
    /// Used for fleeing the Safari Zone or calling for help in SOS battles
    var escapeRate: Int { get set }
}
