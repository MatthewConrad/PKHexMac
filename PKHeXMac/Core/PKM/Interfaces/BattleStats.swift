//
//  BattleStats.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/10/24.
//

import Foundation

protocol EVStats {
    var evHP: Int { get set }
    var evATK: Int { get set }
    var evDEF: Int { get set }
    var evSPE: Int { get set }
    var evSPA: Int { get set }
    var evSPD: Int { get set }

    var evs: [Int] { get set }
    var evTotal: Int { get }
    
    var maxEV: Int { get }
}

extension EVStats {
    var evs: [Int] {
        get {
            [self.evHP, self.evATK, self.evDEF, self.evSPE, self.evSPA, self.evSPD]
        }
        set {
            self.evHP = newValue[0]
            self.evATK = newValue[1]
            self.evDEF = newValue[2]
            self.evSPE = newValue[3]
            self.evSPA = newValue[4]
            self.evSPD = newValue[5]
        }
    }

    var evTotal: Int {
        self.evHP + self.evATK + self.evDEF + self.evSPE + self.evSPA + self.evSPD
    }
}

protocol IVStats {
    var ivHP: Int { get set }
    var ivATK: Int { get set }
    var ivDEF: Int { get set }
    var ivSPE: Int { get set }
    var ivSPA: Int { get set }
    var ivSPD: Int { get set }

    var ivs: [Int] { get set }
    var ivTotal: Int { get }
    
    var maxIV: Int { get }
    var highestIV: Int { get }
    var flawlessIVCount: Int { get }
}

extension IVStats {
    var ivs: [Int] {
        get {
            [self.ivHP, self.ivATK, self.ivDEF, self.ivSPE, self.ivSPA, self.ivSPD]
        }
        set {
            self.ivHP = newValue[0]
            self.ivATK = newValue[1]
            self.ivDEF = newValue[2]
            self.ivSPE = newValue[3]
            self.ivSPA = newValue[4]
            self.ivSPD = newValue[5]
        }
    }

    var ivTotal: Int {
        self.ivHP + self.ivATK + self.ivDEF + self.ivSPE + self.ivSPA + self.ivSPD
    }

    var highestIV: Int {
        max(self.ivHP, self.ivATK, self.ivDEF, self.ivSPE, self.ivSPA, self.ivSPD)
    }

    var flawlessIVCount: Int {
        self.ivs.filter { $0 == self.maxIV }.count
    }
}

protocol BattleStats: EVStats, IVStats {
    var statLevel: UInt8 { get set }
    var statHPMax: Int { get set }
    var statHPCurrent: Int { get set }
    var statATK: Int { get set }
    var statDEF: Int { get set }
    var statSPE: Int { get set }
    var statSPA: Int { get set }
    var statSPD: Int { get set }

    var stats: [Int] { get set }
}

extension BattleStats {
    var starts: [Int] {
        get {
            [self.statHPCurrent, self.statATK, self.statDEF, self.statSPE, self.statSPA, self.statSPD]
        }
        set {
            self.statHPCurrent = newValue[0]
            self.statATK = newValue[1]
            self.statDEF = newValue[2]
            self.statSPE = newValue[3]
            self.statSPA = newValue[4]
            self.statSPD = newValue[5]
        }
    }
}
