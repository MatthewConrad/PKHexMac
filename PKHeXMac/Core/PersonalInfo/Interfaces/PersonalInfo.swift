//
//  PersonalInfo.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

protocol PersonalInfo: BaseStat, EffortValueYield, GenderDetail, PersonalFormInfo, PersonalAbility, PersonalEgg, PersonalEncounter, PersonalType, PersonalMisc {
    /// Writes entry to raw bytes
    func write() -> [UInt8]

    var gender: Int { get set }
    var expGrowth: Int { get set }
}
