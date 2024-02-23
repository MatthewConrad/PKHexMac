//
//  Locations.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/11/24.
//

import Foundation

/// Decorations and logic for Met Location IDs
struct Locations {

    static let LinkTrade4 = 2002
    static let LinkTrade5 = 30003
    static let LinkTrade6 = 30002

    static let Daycare4 = 2000
    static let Daycare5 = 60002
    static let Daycare8b = 60010
    static let Picnic9 = 30023
    static let TeraCavern9 = 30024

    static let LinkTrade2NPC = 126
    static let LinkTrade3NPC = 254
    static let LinkTrade4NPC = 2001
    static let LinkTrade5NPC = 30002
    static let LinkTrade6NPC = 30001

    static let Breeder5 = 60003
    static let Breeder6 = 60004

    static let PokeWalker4 = 233
    static let Ranger4 = 3001
    static let Faraway4 = 3002

    /// Goldenrod City in `GameVersion.C`
    static let HatchLocationC = 16

    /// Route 117 in `GameVersion.RSE`
    static let HatchLocationRSE = 32

    /// Four Island in `GameVersion.FRLG`
    static let HatchLocationFRLG = 146

    /// Solaceon Town in `GameVersion.DPPt`
    static let HatchLocationDPPt = 4

    /// Route 34 in `GameVersion.HGSS`
    static let HatchLocationHGSS = 182

    /// Skyarrow Bridge in `GameVersion.Gen5`
    static let HatchLocation5 = 64

    /// Route 7 in `GameVersion.XY`
    static let HatchLocation6XY = 38

    /// Battle Resort in `GameVersion.ORAS`
    static let HatchLocation6AO = 318

    /// Paniola Ranch in `GameVersion.Gen7`
    static let HatchLocation7 = 78

    /// Route 5 in `GameVersion.SWSH`
    static let HatchLocation8 = 40

    /// Solaceon Town in `GameVersion.BDSP`
    static let HatchLocation8b = 446

    /// South Province (Area One) in `GameVersion.SV`
    static let HatchLocation9 = 6

    /// Generation 1 -> Generation 7 Transfer Location (Kanto)
    static let Transfer1 = 30013

    /// Generation 2 -> Generation 7 Transfer Location (Johto)
    static let Transfer2 = 30017

    /// Generation 3 -> Generation 4 Transfer Location (Pal Park)
    static let Transfer3 = 0x37

    /// Generation 4 -> Generation 5 Transfer Location (Poké Transporter)
    static let Transfer4 = 30001

    /// Generation 4 -> Generation 5 Transfer Location (Crown Celebi - Event not activated in Gen 5)
    static let Transfer4_CelebiUnused = 30010

    /// Generation 4 -> Generation 5 Transfer Location (Crown Celebi - Event activated in Gen 5)
    static let Transfer4_CelebiUsed = 30011

    /// Generation 4 -> Generation 5 Transfer Location (Crown Beast - Event not activated in Gen 5)
    static let Transfer4_CrownUnused = 30012

    /// Generation 4 -> Generation 5 Transfer Location (Crown Beast - Event activated in Gen 5)
    static let Transfer4_CrownUsed = 30013

    /// Generation 6 Gift from Pokémon Link
    static let LinkGift6 = 30011

    /// Generation 7 Poké Pelago
    static let Pelago7 = 30016

    /// Generation 7 Transfer from GO to Pokémon LGP/E's GO Park
    static let GO7 = 50

    /// Generation 8 Transfer from GO to Pokémon HOME
    static let GO8 = 30012

    /// Generation 8 Gift from Pokémon HOME
    static let HOME8 = 30018

    /// Generation 8 BD/SP Magic location for "None" since 0 is an actual met location.
    static let Default8bNone = 65535

    static let SafariLocation_RSE = 57
    static let SafariLocation_FRLG = 136

    static func TradedEggLocation (generation: Int, version: GameVersion) -> Int {
        return if generation == 4 {
            LinkTrade4
        } else if generation == 5 {
            LinkTrade5
        } else if generation == 8 && GameVersion.BDSP.contains(game: version) {
            LinkTrade6NPC
        } else {
            LinkTrade6
        }
    }

    static func IsPtHGSSLocation (location: Int) -> Bool {
        return location > 111 && location < 2000
    }

    static func IsPtHGSSLocationEgg (location: Int) -> Bool {
        return location > 2010 && location < 3000
    }

    static func IsEventLocation3 (location: Int) -> Bool {
        return location == 255
    }

    static func IsEventLocation4 (location: Int) -> Bool {
        return location >= 3000 && location <= 3076
    }

    static func IsEventLocation5 (location: Int) -> Bool {
        return location > 40000 && location < 50000
    }

    static func IsSafariZoneLocation3 (location: Int) -> Bool {
        return [SafariLocation_RSE, SafariLocation_FRLG].contains(location)
    }

    static func IsEggLocationBred4 (location: Int, version: GameVersion) -> Bool {
        if [Daycare4, LinkTrade4].contains(location) {
            return true
        }

        return location == Faraway4 && [GameVersion.Pt, GameVersion.HG, GameVersion.SS].contains(version)
    }

    static func IsEggLocationBred5 (location: Int) -> Bool {
        return [Daycare5, LinkTrade5].contains(location)
    }

    static func IsEggLocationBred6 (location: Int) -> Bool {
        return [Daycare5, LinkTrade6].contains(location)
    }

    static func IsEggLocationBred8b (location: Int) -> Bool {
        return [Daycare8b, LinkTrade6NPC].contains(location)
    }

    static func IsEggLocationBred9 (location: Int) -> Bool {
        return [Picnic9, LinkTrade6].contains(location)
    }

    static func GetDaycareLocation (generation: Int, version: GameVersion) -> Int {
        return if [1, 2, 3].contains(generation) {
            0
        } else if generation == 4 {
            Daycare4
        } else if generation == 5 {
            Daycare5
        } else if generation == 8 && [GameVersion.BD, GameVersion.SP].contains(version) {
            Daycare8b
        } else if generation == 9 {
            Picnic9
        } else {
            Daycare5
        }
    }

    // Ferry
    static func IsMetLocation3RS(location: Int) -> Bool {
        return location <= 87
    }

    // Trainer Hill
    static func IsMetLocation3E(location: Int) -> Bool {
        return location <= 87 || (location >= 197 && location <= 212)
    }

    // Celadon Dept.
    static func IsMetLocation3FRLG(location: Int) -> Bool {
        return location > 87 && location < 197
    }

    // Battle Park
    static func IsMetLocation4DP(location: Int) -> Bool {
        return location <= 111
    }

    // Rock Peak Ruins
    static func IsMetLocation4Pt(location: Int) -> Bool {
        return location <= 125
    }

    // Celadon Dept.
    static func IsMetLocation4HGSS(location: Int) -> Bool {
        return location > 125 && location < 234
    }

    // Abyssal Ruins
    static func IsMetLocation5BW(location: Int) -> Bool {
        return location <= 116
    }

    // Unknown Dungeon
    static func IsMetLocation6XY(location: Int) -> Bool {
        return location <= 168
    }

    // Secret Base
    static func IsMetLocation6AO(location: Int) -> Bool {
        return location > 168 && location <= 354
    }

    // Outer Cape
    static func IsMetLocation7SM(location: Int) -> Bool {
        return location < 200
    }

    // Dividing Peak Tunnel
    static func IsMetLocation7USUM(location: Int) -> Bool {
        return location < 234
    }

    // Pokémon League
    static func IsMetLocation7GG(location: Int) -> Bool {
        return location <= 54
    }

    // Crown Tundra Station
    static func IsMetLocation8SWSH(location: Int) -> Bool {
        return location <= 246
    }

    // Ramanas Park (Genome Room)
    static func IsMetLocation8BDSP(location: Int) -> Bool {
        return location <= 657
    }

    // Training Grounds
    static func IsMetLocation8LA(location: Int) -> Bool {
        return location <= 155
    }

    // Terarium (Entry Tunnel)
    static func IsMetLocation9SV(location: Int) -> Bool {
        return location <= 200
    }

}
