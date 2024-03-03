//
//  PersonalInfo1.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

struct PersonalInfo1: PersonalInfo, PersonalTM {
    private var data: [UInt8]
    
    static let SIZE: Int = 0x1c
    private static let TMHM = 0x14
    private static let countTMHM = 50 + 5 // 50 TMs, 5 HMs
    private static let byteCountTMHM = (countTMHM + 7) / 8
    
    // 0-2 to indicate how many steps down to get the base Species ID
    private static let evoStages: [UInt8] = [
        0, 0, 1, 2, 0, 1, 2, 0, 1, 2,
        0, 1, 2, 0, 1, 2, 0, 1, 2, 0,
        1, 0, 1, 0, 1, 0, 1, 0, 1, 0,
        1, 2, 0, 1, 2, 0, 1, 0, 1, 0,
        1, 0, 1, 0, 1, 2, 0, 1, 0, 1,
        0, 1, 0, 1, 0, 1, 0, 1, 0, 1,
        0, 1, 2, 0, 1, 2, 0, 1, 2, 0,
        1, 2, 0, 1, 0, 1, 2, 0, 1, 0,
        1, 0, 1, 0, 0, 1, 0, 1, 0, 1,
        0, 1, 0, 1, 2, 0, 0, 1, 0, 1,
        0, 1, 0, 1, 0, 1, 0, 0, 0, 0,
        1, 0, 1, 0, 0, 0, 0, 1, 0, 1,
        0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 0, 0, 0, 1, 1, 1, 0, 0, 1,
        0, 1, 0, 0, 0, 0, 0, 0, 1, 2,
    ]
    
    init(data: [UInt8]) {
        self.data = data
    }

    func write() -> [UInt8] {
        return self.data
    }
    
    var gender: UInt8 {
        get { self.data[0x00] }
        set { self.data[0x00] = newValue }
    }
        
    var HP: Int {
        get { Int(self.data[0x01]) }
        set { self.data[0x01] = UInt8(newValue) }
    }

    var ATK: Int {
        get { Int(self.data[0x02]) }
        set { self.data[0x03] = UInt8(newValue) }
    }

    var DEF: Int {
        get { Int(self.data[0x03]) }
        set { self.data[0x03] = UInt8(newValue) }
    }

    var SPE: Int {
        get { Int(self.data[0x04]) }
        set { self.data[0x04] = UInt8(newValue) }
    }
    
    var SPC: Int {
        get { Int(self.data[0x05]) }
        set { self.data[0x05] = UInt8(newValue) }
    }

    var SPA: Int {
        get { self.SPC }
        set { self.SPC = newValue }
    }

    var SPD: Int {
        get { self.SPC }
        set { self.SPC = newValue }
    }
    
    var type1: Int {
        get { Int(self.data[0x06]) }
        set { self.data[0x06] = UInt8(newValue) }
    }

    var type2: Int {
        get { Int(self.data[0x07]) }
        set { self.data[0x07] = UInt8(newValue) }
    }
    
    var catchRate: Int {
        get { Int(self.data[0x08]) }
        set { self.data[0x08] = UInt8(newValue) }
    }

    var baseEXP: Int {
        get { Int(self.data[0x09]) }
        set { self.data[0x09] = UInt8(newValue) }
    }
    
    var move1: UInt8 {
        get { self.data[0x0f] }
        set { self.data[0x0f] = newValue }
    }
    
    var move2: UInt8 {
        get { self.data[0x10] }
        set { self.data[0x10] = newValue }
    }

    var move3: UInt8 {
        get { self.data[0x11] }
        set { self.data[0x11] = newValue }
    }

    var move4: UInt8 {
        get { self.data[0x12] }
        set { self.data[0x12] = newValue }
    }

    var expGrowth: UInt8 {
        get { self.data[0x13] }
        set { self.data[0x13] = newValue }
    }
    
    // EV yields are aliases for base stats in Gen1
    var EV_HP: Int { get { self.HP } set {} }
    var EV_ATK: Int { get { self.ATK } set {} }
    var EV_DEF: Int { get { self.DEF } set {} }
    var EV_SPE: Int { get { self.HP } set {} }
    
    var EV_SPC: Int { self.SPC }
    
    var EV_SPA: Int { get { self.EV_SPC } set {} }
    var EV_SPD: Int { get { self.EV_SPC } set {} }
    
    // Unused values from future games
    var formStatsIndex: Int { get { 0 } set {} }
    var abilityCount: Int { 0 }

    var group1: Int { get { 0 } set {} }
    var group2: Int { get { 0 } set {} }
    
    var evoStage: Int { get { 0 } set {} }
    var color: Int { get { 0 } set {} }
    var height: Int { get { 0 } set {} }
    var weight: Int { get { 0 } set {} }
    
    var hatchCycles: Int { get { 0 } set {}}
    var baseFriendship: Int { get { 0 } set {}}
    var escapeRate: Int { get { 0 } set {}}
    
    func getIndex(ability: Ability) -> Int { -1 }
    func getAbility(index: Int) -> Ability { Ability.None }
    func getAbilities() -> [Ability] { [] }
    
    func getMoves() -> [UInt8] {
        [self.move1, self.move2, self.move3, self.move4]
    }
    
    func isLearnTM(index: Int) -> Bool {
        return if UInt8(index) >= PersonalInfo1.countTMHM {
            false
        } else {
            (data[PersonalInfo1.TMHM + (index >> 3)] & (1 << (index & 7))) != 0
        }
    }
    
    mutating func setLearnTM(index: Int, value: Bool) {
        if UInt8(index) >= PersonalInfo1.countTMHM {
            return
        }
        
        if value {
            self.data[PersonalInfo1.TMHM + (index >> 3)] |= UInt8(1 << (index & 7))
        } else {
            self.data[PersonalInfo1.TMHM + (index >> 3)] |= ~UInt8(1 << (index & 7))
        }
    }
    
    func setAllLearnTM(result: inout [Bool], moves: [UInt8]) {
        let span = self.data[PersonalInfo1.TMHM ..< (PersonalInfo1.TMHM + PersonalInfo1.byteCountTMHM)]
        
        for index in stride(from: PersonalInfo1.countTMHM - 1, through: 0, by: -1) {
            if span[index >> 3] & (1 << (index & 7)) != 0 {
                result[Int(moves[index])] = true
            }
        }
    }
    
    /// Gets the amount of times a species has evolved from the base species
    static func getEvolutionState(species: Species) -> Int {
        return if species.rawValue >= evoStages.count {
            0
        } else {
            Int(evoStages[species.rawValue])
        }
    }
    
    private func isMatchType(type1: Int, type2: Int) -> (Bool, Bool) {
        (type1 == self.type1, type2 == self.type2)
    }
    
    func isMatchType(pt: PersonalType) -> (Bool, Bool) {
        isMatchType(type1: pt.type1, type2: pt.type2)
    }
}
