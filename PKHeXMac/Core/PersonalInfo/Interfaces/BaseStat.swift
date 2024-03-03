//
//  BaseStat.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

struct StatIndex: Codable {
    let stat, index: Int
}

protocol BaseStat {
    var HP: Int { get set }
    var ATK: Int { get set }
    var DEF: Int { get set }
    var SPA: Int { get set }
    var SPD: Int { get set }
    var SPE: Int { get set }
}

extension BaseStat {
    /// Base Stat Total sum of all stats
    func getBaseStatTotal() -> Int {
        return self.HP + self.ATK + self.DEF + self.SPA + self.SPD + self.SPE
    }

    /// Gets the requested Base Stat value with the requested index
    func getBaseStatValue(index: Int) -> Int {
        switch index {
        case 0:
            return self.HP
        case 1:
            return self.ATK
        case 2:
            return self.DEF
        case 3:
            return self.SPE
        case 4:
            return self.SPA
        case 5:
            return self.SPD
        default:
            return -1
        }
    }

    /// Gathers Base Stat values and returns them sorted from highest to lowest
    func getSortedStatIndexes() -> [StatIndex] {
        let statIndexes = (0 ... 5).map { StatIndex(stat: self.getBaseStatValue(index: $0), index: $0) }
        
        return statIndexes.sorted { $0.stat > $1.stat }
    }
}
