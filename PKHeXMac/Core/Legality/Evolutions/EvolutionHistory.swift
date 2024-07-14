//
//  EvolutionHistory.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/14/24.
//

import Foundation

/// Stores the possible evolution bounds for a parsed entity with respect to its origins and game traversal.
struct EvolutionHistory {
    private static var NONE: [EvoCriteria] {
        []
    }

    var gen1: [EvoCriteria] = NONE
    var gen2: [EvoCriteria] = NONE
    var gen3: [EvoCriteria] = NONE
    var gen4: [EvoCriteria] = NONE
    var gen5: [EvoCriteria] = NONE
    var gen6: [EvoCriteria] = NONE
    var gen7: [EvoCriteria] = NONE
    var gen8: [EvoCriteria] = NONE
    var gen9: [EvoCriteria] = NONE

    var gen7b: [EvoCriteria] = NONE
    var gen8a: [EvoCriteria] = NONE
    var gen8b: [EvoCriteria] = NONE

    var hasVisitedGen1: Bool {
        gen1.count > 0
    }

    var hasVisitedGen2: Bool {
        gen2.count > 0
    }
    
    var hasVisitedGen3: Bool {
        gen3.count > 0
    }
    
    var hasVisitedGen4: Bool {
        gen4.count > 0
    }
    
    var hasVisitedGen5: Bool {
        gen5.count > 0
    }
    
    var hasVisitedGen6: Bool {
        gen6.count > 0
    }
    
    var hasVisitedGen7: Bool {
        gen7.count > 0
    }
    
    var hasVisitedSWSH: Bool {
        gen8.count > 0
    }
    
    var hasVisitedGen9: Bool {
        gen9.count > 0
    }
    
    var hasVisitedLGPE: Bool {
        gen7b.count > 0
    }
    
    var hasVisitedPLA: Bool {
        gen8a.count > 0
    }
    
    var hasVisitedBDSP: Bool {
        gen8b.count > 0
    }
    
    func get(context: EntityContext) -> [EvoCriteria] {
        return switch context {
        case .Gen1:
            gen1
        case .Gen2:
            gen2
        case .Gen3:
            gen3
        case .Gen4:
            gen4
        case .Gen5:
            gen5
        case .Gen6:
            gen6
        case .Gen7:
            gen7
        case .Gen8:
            gen8
        case .Gen9:
            gen9
        case .Gen7b:
            gen7b
        case .Gen8a:
            gen8a
        case .Gen8b:
            gen8b
        default:
            fatalError("Invalid EntityContext")
        }
    }
    
    static func hasVisited(evos: [EvoCriteria], species: Species) -> Bool {
        for evo in evos {
            if evo.species == species {
                return true
            }
        }
        
        return false
    }
}
