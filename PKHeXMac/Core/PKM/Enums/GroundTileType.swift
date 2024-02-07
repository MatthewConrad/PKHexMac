//
//  GroundTileType.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

/*
 Ground Tile Type the PKM was encountered from.
 Used in Generation 4 games, this value is set depending on what type of overworld tile the player is standing on when the PKM is obtained.
 */
enum GroundTileType: Int {
    case None = 0 // no animation for the tile
    case Sand = 1 // obtainable only via HG/SS
    case Grass = 2
    case Puddle = 3 // no encounters from this tile type
    case Rock = 4
    case Cave = 5
    case Snow = 6 // no encounters from this tile type
    case Water = 7
    case Ice = 8 // no encounters from this tile type
    case Building = 9
    case Marsh = 10
    case Bridge = 11 // no encounters from this tile type
    case Max_DP = 12 // unspecific, catch-all for D/P undefined tiles
    
    // added tile types in Pt
    // no encounters from these tile types
    case Elite4_1 = 13 // Elite Four Room #1
    case Elite4_2 = 14
    case Elite4_3 = 15
    case Elite4_4 = 16
    case Elite4_M = 17 // Elite Four Champion Room
    case DistortionSideways = 18 // Distortion World (not Giratina)
    case BattleTower = 19
    case BattleFactory = 20
    case BattleArcade = 21
    case BattleCastle = 22
    case BattleHall = 23
    
    case Distortion = 24
    case Max_Pt = 25 // unspecific, catch-all for Pt undefined tiles
}

class GroundTileTypeExtensions {
    
    func isObtainable (tileType: GroundTileType) -> Bool {
        return (0b110000000000101101011011 >> tileType.rawValue) & 1 == 1
    }
    
    let ValidTileTypes = [GroundTileType.None, GroundTileType.Sand, GroundTileType.Grass, GroundTileType.Rock, GroundTileType.Cave, GroundTileType.Water, GroundTileType.Building, GroundTileType.Marsh, GroundTileType.Max_DP, GroundTileType.Max_Pt, GroundTileType.Distortion]
}

