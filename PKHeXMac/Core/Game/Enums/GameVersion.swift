//
//  GameVersion.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

/// Game Version ID enum shared between actual Version IDs and lumped version groupings.
enum GameVersion: Int, CaseIterable, Comparable
{
    // region Indicators for method empty arguments & result indication. Not stored values.
    case AnyGame = 0,
    Unknown = -1,
    InvalidGame = -2,
    
    // The following values are IDs stored within PKM data, and can also identify individual games.
    
    // Pokémon Sapphire (GBA)
    S = 1,
    // Pokémon Ruby (GBA)
    R = 2,
    // Pokémon Emerald (GBA)
    E = 3,
    // Pokémon FireRed (GBA)
    FR = 4,
    // Pokémon LeafGreen (GBA)
    LG = 5,
    // Pokémon Colosseum &amp; Pokémon XD (GameCube)
    CXD = 15,
    // Pokémon Diamond (NDS)
    D = 10,
    // Pokémon Pearl (NDS)
    P = 11,
    // Pokémon Platinum (NDS)
    Pt = 12,
    // Pokémon HeartGold (NDS)
    HG = 7,
    // Pokémon SoulSilver (NDS)
    SS = 8,
    // Pokémon White (NDS)
    W = 20,
    // Pokémon Black (NDS)
    B = 21,
    // Pokémon White 2 (NDS)
    W2 = 22,
    // Pokémon Black 2 (NDS)
    B2 = 23,
    // Pokémon X (3DS)
    X = 24,
    // Pokémon Y (3DS)
    Y = 25,
    // Pokémon Alpha Sapphire (3DS)
    AS = 26,
    // Pokémon Omega Ruby (3DS)
    OR = 27,
    // Pokémon Sun (3DS)
    SN = 30,
    // Pokémon Moon (3DS)
    MN = 31,
    // Pokémon Ultra Sun (3DS)
    US = 32,
    // Pokémon Ultra Moon (3DS)
    UM = 33,
    // Pokémon GO (GO -> Let's Go/HOME transfers)
    GO = 34,
    // Pokémon Red (3DS Virtual Console)
    RD = 35,
    // Pokémon Green[JP]/Blue[INT] (3DS Virtual Console)
    GN = 36,
    // Pokémon Blue[JP] (3DS Virtual Console)
    BU = 37,
    // Pokémon Yellow (3DS Virtual Console)
    YW = 38,
    // Pokémon Gold (3DS Virtual Console)
    GD = 39,
    // Pokémon Silver (3DS Virtual Console)
    SI = 40,
    // Pokémon Crystal (3DS Virtual Console)
    C = 41,
    // Pokémon: Let's Go, Pikachu! (NX)
    GP = 42,
    // Pokémon: Let's Go, Eevee! (NX)
    GE = 43,
    // Pokémon Sword (NX)
    SW = 44,
    // Pokémon Shield (NX)
    SH = 45,
    //     HOME = 46,
    // Pokémon Legends: Arceus (NX)
    PLA = 47,
    // Pokémon Brilliant Diamond (NX)
    BD = 48,
    // Pokémon Shining Pearl (NX)
    SP = 49,
    // Pokémon Scarlet (NX)
    SL = 50,
    // Pokémon Violet (NX)
    VL = 51,
    // Pokémon Red &amp; Blue [<see cref="SAV1"/>] identifier.
    RB,
    // Pokémon Red/Blue/Yellow [<see cref="SAV1"/>] identifier.
    RBY,
    // Pokémon Gold &amp; Silver [<see cref="SAV2"/>] identifier.
    GS,
    // Pokémon Gold/Silver/Crystal [<see cref="SAV2"/>] identifier.
    GSC,
    // Pokémon Ruby &amp; Sapphire [<see cref="SAV3"/>] identifier.
    RS,
    // Pokémon Ruby/Sapphire/Emerald [<see cref="SAV3"/>] identifier.
    RSE,
    // Pokémon FireRed/LeafGreen [<see cref="SAV3"/>] identifier.
    FRLG,
    // Pokémon Box Ruby &amp; Sapphire [<see cref="SAV3RSBox"/>] identifier.
    RSBOX,
    // Pokémon Colosseum [<see cref="SAV3Colosseum"/>] identifier.
    COLO,
    // Pokémon XD [<see cref="SAV3XD"/>] identifier.
    XD,
    // Pokémon Diamond &amp; Pearl [<see cref="SAV4"/>] identifier.
    DP,
    // Pokémon Diamond/Pearl/Platinum version group.
    DPPt,
    // Pokémon HeartGold &amp; SoulSilver [<see cref="SAV4"/>] identifier.
    HGSS,
    // Pokémon Battle Revolution [<see cref="SAV4BR"/>] identifier.
    BATREV,
    // Pokémon Black &amp; White version group.
    BW,
    // Pokémon Black 2 &amp; White 2 version group.
    B2W2,
    // Pokémon X &amp; Y
    XY,
    // Pokémon Omega Ruby &amp; Alpha Sapphire Demo
    ORASDEMO,
    // Pokémon Omega Ruby &amp; Alpha Sapphire version group.
    ORAS,
    // Pokémon Sun &amp; Moon
    SM,
    // Pokémon Ultra Sun &amp; Ultra Moon
    USUM,
    // Pokémon Let's Go Pikachu &amp; Eevee
    GG,
    // Pokémon Sword &amp; Shield
    SWSH,
    // Pokémon Brilliant Diamond &amp; Shining Pearl
    BDSP,
    // Pokémon Scarlet &amp; Violet
    SV,
    // Generation 1 Games
    Gen1,
    // Generation 2 Games
    Gen2,
    // Generation 3 Games
    Gen3,
    // Generation 4 Games
    Gen4,
    // Generation 5 Games
    Gen5,
    // Generation 6 Games
    Gen6,
    // Generation 7 Games on the Nintendo 3DS
    Gen7,
    // Generation 7 Games on the Nintendo Switch
    Gen7b,
    // Generation 8 Games
    
    Gen8,
    // Generation 9 Games
    Gen9,
    // Pocket Monsters Stadium data origin identifier
    StadiumJ,
    // Pokémon Stadium data origin identifier
    Stadium,
    // Pokémon Stadium 2 data origin identifier
    Stadium2
    
    /// Most recent Version ID utilized by official games
    /// - remark: Originally from Game/GameUtil
    static var HighestGameId: GameVersion = .RB
    
    static func < (lhs: GameVersion, rhs: GameVersion) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    /// Checks if the Game Version contains a given version
    /// - parameters:
    ///     - game: the Game Version to check that `self` contains
    /// - remark: Originally from Game/GameUtil
    func contains(game: GameVersion) -> Bool {
        if(self == game || self == .AnyGame) {
            return  true;
        }
        
        switch self {
        case .RB:
            return [.RD,.BU,.GN].contains(game)
        case .RBY,.Stadium:
            
            return GameVersion.RB.contains(game: game) || game == .YW
        case .Gen1:
            return GameVersion.RBY.contains(game: game) || game == .Stadium
            
        case .GS:
            return [.GD,.SI].contains(game)
        case .GSC,.Stadium2:
            return GameVersion.GS.contains(game: game) || game == .C
        case .Gen2:
            return GameVersion.GSC.contains(game: game) || game == .Stadium2
            
        case .RS:
            return [.R,.S].contains(game)
        case .RSE:
            return GameVersion.RS.contains(game: game) || game == .E
        case .FRLG:
            return [.FR,.LG].contains(game)
        case .COLO,.XD:
            return game == .CXD
        case .CXD:
            return [.COLO,.XD].contains(game)
        case .RSBOX:
            return GameVersion.RSE.contains(game: game) || GameVersion.FRLG.contains(game: game)
        case .Gen3:
            return GameVersion.RSBOX.contains(game: game) || GameVersion.CXD.contains(game: game) || game == .RSBOX
            
        case .DP:
            return [.D,.P].contains(game)
        case .HGSS:
            return [.HG,.SS].contains(game)
        case .DPPt:
            return GameVersion.DP.contains(game: game) || game == .Pt
        case .BATREV:
            return GameVersion.DPPt.contains(game: game) || GameVersion.HGSS.contains(game: game)
        case .Gen4:
            return GameVersion.BATREV.contains(game: game) || game == .BATREV
            
        case .BW:
            return [.B,.W].contains(game)
        case .B2W2:
            return [.B2,.W2].contains(game)
        case .Gen5:
            return GameVersion.BW.contains(game: game) || GameVersion.B2W2.contains(game: game)
            
        case .XY:
            return [.X,.Y].contains(game)
        case .ORAS:
            return [.OR,.AS].contains(game)
        case .Gen6:
            return GameVersion.XY.contains(game:game) || GameVersion.ORAS.contains(game: game)
            
        case .SM:
            return [.SN,.MN].contains(game)
        case .USUM:
            return [.US,.UM].contains(game)
        case .GG:
            return [.GP,.GE].contains(game)
        case .Gen7:
            return GameVersion.SM.contains(game: game) || GameVersion.USUM.contains(game: game)
        case .Gen7b:
            return GameVersion.GG.contains(game: game) || game == .GO
            
        case .SWSH:
            return [.SW,.SH].contains(game)
        case .BDSP:
            return [.BD,.SP].contains(game)
        case .Gen8:
            return GameVersion.SWSH.contains(game: game) || GameVersion.BDSP.contains(game: game) || game == .PLA
            
        case .SV:
            return [.SL,.VL].contains(game)
        case .Gen9:
            return GameVersion.SV.contains(game: game)
        default:
            return false
        }
    }
    
    /// Indiicates if the Game Version value is a game value or an aggregate indicator
    /// - returns: Whether the Game Version represents a valid game.
    /// - remark: Originally from Game/GameUtil
    func isValidSavedVersion() -> Bool {
        return self > .AnyGame && self < .HighestGameId
    }
    
    /// Gets all possible GameVersion values representing games
    /// - returns: An array of valid game versions, roughly by most recent games first
    /// - remark: Originally from Game/GameUtil
    static func getValidGameVersions() -> [GameVersion] {
        var all: [GameVersion] = GameVersion.allCases
        var valid = all.filter({ $0.isValidSavedVersion()})
        
        return valid.reversed()
    }
    
    ///  Determines the Version Grouping of an input Version ID
    /// - returns: Version Group ID or `InvalidGame` if type cannot be determined
    /// - remark: Originally from Game/GameUtil
    func getMetLocationVersionGroup () -> GameVersion {
        switch self {
            // side games
        case .CXD:
            return .CXD
        case .GO:
            return .GO
            // Virtual Console transfers
        case .RD,.BU,.YW,.GN,.GD,.SI,.C:
            return .USUM
            // Gen2
        case .GS,.GSC:
            return .GSC
            
            // Gen3
        case .R,.S:
            return .RS
        case .E:
            return .E
        case .FR,.LG:
            return .FR
            
            // Gen4
        case .D,.P:
            return .DP
        case .Pt:
            return .Pt
        case .HG,.SS:
            return .HGSS
            // Gen5
        case .B,.W:
            return .BW
        case .B2,.W2:
            return .B2W2
            
            // Gen6
        case .X,.Y:
            return .XY
        case .OR,.AS:
            return .ORAS
            
            // Gen7
        case .SN,.MN:
            return .SM
        case .US,.UM:
            return .USUM
        case .GP,.GE:
            return .GG
            
            // Gen8
        case .SW,.SH:
            return .SWSH
        case .BD,.SP:
            return .BDSP
        case .PLA:
            return .PLA
            
            // Gen9
        case .SL,.VL:
            return .SV
        default:
            return .InvalidGame
        }
    }
    
    /// Gets a version ID from the end of that Generation
    /// - parameters:
    ///   - generation: an `Int` representing the generation
    /// - remark: Originally from Game/GameUtil
    static func getVersion(generation: Int) -> GameVersion {
        switch generation {
        case 1:
            return .RBY
        case 2:
            return .C
        case 3:
            return .E
        case 4:
            return .SS
        case 5:
            return .W2
        case 6:
            return .AS
        case 7:
            return .UM
        case 8:
            return .SH
        case 9:
            return .VL
        default:
            return .InvalidGame
        }
    }
    
    /// Gets the Generation the Game Version belongs to.
    /// - returns: An `Int` representing the Generation ID
    /// - remark: Originally from Game/GameUtil
    func getGeneration() -> Int {
        return if GameVersion.Gen1.contains(game: self) {
            1
        } else if GameVersion.Gen2.contains(game: self){
            2
        } else if GameVersion.Gen3.contains(game: self){
            3
        } else if GameVersion.Gen4.contains(game: self){
            4
        } else if GameVersion.Gen5.contains(game: self){
            5
        } else if GameVersion.Gen6.contains(game: self){
            6
        } else if GameVersion.Gen7.contains(game: self){
            7
        } else if GameVersion.Gen7b.contains(game: self){
            7
        } else if GameVersion.Gen8.contains(game: self){
            8
        } else if GameVersion.Gen9.contains(game: self){
            9
        } else {
            -1
        }
    }
    
    /// Translates a main series GameVersion to the corresponding GCVersion.
    /// - returns: A GameCube series `GCVersion` Version ID
    /// - remark: Originally defined in Game/Enums/GCVersion as `GetCXDVersionID`
    func getGCGeneration() -> GCVersion {
        switch self {
        case .S:
            return GCVersion.S
        case .R:
            return GCVersion.R
        case .E:
            return GCVersion.E
        case .FR:
            return GCVersion.FR
        case .LG:
            return GCVersion.LG
        case .CXD:
            return GCVersion.CXD
        default:
            return GCVersion.None
        }
    }
        
    /// Lists the possible versions within the generation.
    /// - parameters:
    ///   - generation: the generation number
    /// - returns: a `GameVersion` array
    static func getVersionsInGeneration(generation: Int) -> [GameVersion] {
        return GameVersion.allCases.filter({ $0.getGeneration() == generation})
    }
    
    /// - remark: Originally from Game/GameUtil
    func getVersionsWithinRange(limit: Int) -> [GameVersion] {
        // TODO: implement me
        return [GameVersion.AS]
    }
    
    /// Lists the versions contained within the GameVersion.
    /// - parameters:
    ///   - source: the array to retrieve versions from
    /// - returns: an array of `GameVersion`s contained by the GameVersion
    /// - remark: Originally from Game/GameUtil
    func getVersionsWithinRange(source: [GameVersion]) -> [GameVersion] {
        return source.filter({ self.contains(game: $0)} )
    }
    
    /// Gets the maximum Species ID for the game version.
    /// - returns: The max valid `Species` for the game version.
    /// - remark: Originally from Game/GameUtil
    func getMaxSpeciesID() -> Int {
        return if GameVersion.Gen1.contains(game: self) {
            Legal.MaxSpeciesID_1.rawValue
        } else if GameVersion.Gen2.contains(game: self){
            Legal.MaxSpeciesID_2.rawValue
        } else if GameVersion.Gen3.contains(game: self){
            Legal.MaxSpeciesID_3.rawValue
        } else if GameVersion.Gen4.contains(game: self){
            Legal.MaxSpeciesID_4.rawValue
        } else if GameVersion.Gen5.contains(game: self){
            Legal.MaxSpeciesID_5.rawValue
        } else if GameVersion.Gen6.contains(game: self){
            Legal.MaxSpeciesID_6.rawValue
        } else if GameVersion.SM.contains(game: self){
            Legal.MaxSpeciesID_7.rawValue
        } else if GameVersion.Gen7.contains(game: self){
            Legal.MaxSpeciesID_7_USUM.rawValue
        } else if GameVersion.Gen7b.contains(game: self){
            Legal.MaxSpeciesID_7b.rawValue
        } else if self == .PLA {
            Legal.MaxSpeciesID_8a.rawValue
        } else if GameVersion.BDSP.contains(game: self){
            Legal.MaxSpeciesID_8b.rawValue
        } else if GameVersion.Gen8.contains(game: self){
            Legal.MaxSpeciesID_8.rawValue
        } else if GameVersion.Gen9.contains(game: self){
            Legal.MaxSpeciesID_9.rawValue
        } else {
            0
        }
    }
    
    
}

/// Game version analogues used by Colosseum/XD instead of the main-series values.
/// - remark: originally defined in Enums/GCVersion
enum GCVersion: Int, CaseIterable, Comparable {
    case None = 0,
         FR = 1,
         LG = 2,
         S = 8,
         R = 9,
         E = 10,
         CXD = 11
    
    static func < (lhs: GCVersion, rhs: GCVersion) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    /// Translates a GameCube series `GCVersion` Version ID to the corresponding `GameVersion`.
    /// - returns: A main series Version ID
    /// - remark: Originally from Game/GCVersion
    func getG3VersionID () -> GameVersion {
        switch self {
        case .S:
            return GameVersion.S
        case .R:
            return GameVersion.R
        case .E:
            return GameVersion.E
        case .FR:
            return GameVersion.FR
        case .LG:
            return GameVersion.LG
        case .CXD:
            return GameVersion.CXD
        default:
            return GameVersion.Unknown
        }
    }
}
