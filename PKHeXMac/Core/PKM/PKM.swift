//
//  PKM.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

protocol PKMProtocol: SpeciesFormSettable, BattleStats, BattleMoves, Ganbaru, TrainerID32, Meetable, Hatchable, Shinyable, LangNick, GameValueLimit, FatefulEncounterable, NatureSettable {
    // TODO: figure out proper way to handle readonly Extensions, Extension

    var sizeParty: Int { get }
    var sizeStored: Int { get }

    var personalInfo: PersonalInfo { get }

    var data: [UInt8] { get }
    var extraBytes: [UInt16] { get }

    init()
    init(data: [UInt8])
    init(size: Int)

    func encrypt() -> [UInt8]
    func write() -> [UInt8]
    func updateChecksum()

    var encryptedPartyData: [UInt8] { get }
    var encryptedBoxData: [UInt8] { get }
    var decryptedPartyData: [UInt8] { get }
    var decryptedBoxData: [UInt8] { get }

    /// Rough indication if the data is junk or not.
    var valid: Bool { get set }

    /// Trash bytes
    var nicknameTrash: [UInt8] { get }
    var originalTrainerTrash: [UInt8] { get }
    var handlingTrainerTrash: [UInt8] { get }

    var context: EntityContext { get }
    var format: UInt8 { get }
    var version: GameVersion { get set }
    var trainerIDDisplayFormat: TrainerIDFormat { get }

    var gender: UInt8 { get set }
    var ability: Ability { get set }
    var abilityNumber: Int { get set }

    var exp: UInt { get set }

    var originalTrainerName: String { get set }
    var originalTrainerGender: UInt8 { get set }

    var ball: UInt8 { get set }
    var metLevel: UInt8 { get set }

    var encryptionConstant: UInt { get set }

    var PID: UInt { get set }

    var language: Int { get set }

    var TSV: UInt { get }
    var PSV: UInt { get }

    var isUntraded: Bool { get }
    var isOriginValid: Bool { get }
}

extension PKMProtocol {
    var extraBytes: [UInt16] { [] }

    func write() -> [UInt8] {
        self.updateChecksum()
        return self.data
    }

    var encryptedPartyData: [UInt8] {
        Array(self.encrypt().prefix(self.sizeParty))
    }

    var encryptedBoxData: [UInt8] {
        Array(self.encrypt().prefix(self.sizeStored))
    }

    var decryptedPartyData: [UInt8] {
        Array(self.write().prefix(self.sizeParty))
    }

    var decryptedBoxData: [UInt8] {
        Array(self.write().prefix(self.sizeStored))
    }

    var handlingTrainerTrash: [UInt8] {
        []
    }

    var format: UInt8 {
        UInt8(self.context.generation())
    }

    var TrainerIDDisplayFormat: TrainerIDFormat { self.getTrainerIDFormat() }

    var statNature: Nature {
        get {
            self.nature
        }

        set {
            self.nature = newValue
        }
    }

    var abilityNumber: Int { 0 }
    var PIDAbility: Int {
        return if self.generation > 5 || self.format > 5 {
            -1
        } else if self.version == .CXD {
            personalInfo.getIndex(ability: self.ability) // Can mismatch; not tied to PID
        } else {
            Int((self.Gen5 ? PID >> 16 : PID) & 1)
        }
    }

    var isShiny: Bool { self.TSV == self.PSV }
    var shinyXOR: UInt16 {
        let tmp = self.ID32 ^ self.PID
    }

    var RS: Bool { [.R, .S].contains(self.version) }
    var E: Bool { self.version == .E }
    var FRLG: Bool { [.FR, .LG].contains(self.version) }
    var DP: Bool { [.D, .P].contains(self.version) }
    var Pt: Bool { self.version == .Pt }
    var HGSS: Bool { [.HG, .SS].contains(self.version) }
    var BW: Bool { [.B, .W].contains(self.version) }
    var B2W2: Bool { [.B2, .W2].contains(self.version) }
    var XY: Bool { [.X, .Y].contains(self.version) }
    var AO: Bool { [.AS, .OR].contains(self.version) }
    var SM: Bool { [.SN, .MN].contains(self.version) }
    var USUM: Bool { [.US, .UM].contains(self.version) }
    var GO: Bool { self.version == .GO }
    var VC1: Bool { (.RD ... .YW).contains(self.version) }
    var VC2: Bool { (.GD ... .C).contains(self.version) }
    var LGPE: Bool { [.GP, .GE].contains(self.version) }
    var SWSH: Bool { [.SW, .SH].contains(self.version) }
    var BDSP: Bool { [.BD, .SP].contains(self.version) }
    var LA: Bool { self.version == .PLA }
    var SV: Bool { [.SL, .VL].contains(self.version) }

    var GO_LGPE: Bool { self.GO && self.metLocation == Locations.GO7 }
    var GO_HOME: Bool { self.GO && self.metLocation == Locations.GO8 }
    var VC: Bool { self.VC1 || self.VC2 }
    var GG: Bool { self.LGPE || self.GO_LGPE }

    var Gen9: Bool { self.SV }
    var Gen8: Bool { self.SWSH || self.BDSP || self.LA || self.GO_HOME }
    var Gen7: Bool { self.SM || self.USUM || self.GG }
    var Gen6: Bool { self.XY || self.AO }
    var Gen5: Bool { self.BW || self.B2W2 }
    var Gen4: Bool { self.DP || self.Pt || self.HGSS }
    var Gen3: Bool { self.RS || self.E || self.FRLG || self.version == .CXD }
    var Gen2: Bool { self.version == .GSC } // fixed value set by Gen2 PKM classes
    var Gen1: Bool { self.version == .RBY } // fixed value set by Gen1 PKM classes
    var GenU: Bool { self.generation <= 0 }

    var generation: UInt8 {
        return if self.Gen9 {
            9
        } else if self.Gen8 {
            8
        } else if self.Gen7 {
            7
        } else if self.Gen6 {
            6
        } else if self.Gen5 {
            5
        } else if self.Gen4 {
            4
        } else if self.Gen3 {
            3
        } else if self.Gen2 || self.Gen1 {
            self.format
        } else if self.VC1 {
            1
        } else if self.VC2 {
            2
        } else {
            0
        }
    }

    var currentLevel: UInt8 {
        get {
            Experience.getLevel(exp: self.exp, growth: self.personalInfo.expGrowth)
        }

        set {
            self.exp = Experience.getEXP(level: newValue, growth: self.personalInfo.expGrowth)
        }
    }

    var isUntraded: Bool {
        false
    }

    var isOriginValid: Bool {
        self.species.rawValue <= maxSpeciesID
    }

    /// Returns false if the Met Location has been overwritten via generational transfer
    var hasOriginalMetLocation: Bool {
        !(self.format < 3 || self.VC || (self.generation <= 4 && self.format != self.generation))
    }

    /// Applies the desired Ability option (0 / 1 / 2)
    mutating func refreshAbility(_ n: Int) {
        self.abilityNumber = 1 << n

        if n < personalInfo.abilityCount {
            self.ability = personalInfo.getAbility(index: n)
        }
    }

    /// Applies a `PID` to the `PKM` according to the specified `gender`
    /// - remark: if a `PKM` originated prior to Gen6, the `EncryptionConstant` is updated
    mutating func setPIDGender(_ gender: UInt8) {
        // TODO: write me!
    }

    /// Applies a `PID` to the `PKM` according to the specified `nature`
    /// - remark: if a `PKM` originated prior to Gen6, the `EncryptionConstant` is updated
    mutating func setPIDNature(_ nature: Nature) {
        // TODO: write me!
    }
}
