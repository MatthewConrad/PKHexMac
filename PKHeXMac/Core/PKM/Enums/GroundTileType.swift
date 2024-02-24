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
    case None = 0, // no animation for the tile
         Sand = 1, // obtainable only via HG/SS
         Grass = 2,
         Puddle = 3, // no encounters from this tile type
         Rock = 4,
         Cave = 5,
         Snow = 6, // no encounters from this tile type
         Water = 7,
         Ice = 8, // no encounters from this tile type
         Building = 9,
         Marsh = 10,
         Bridge = 11, // no encounters from this tile type
         Max_DP = 12, // unspecific, catch-all for D/P undefined tiles

         // added tile types in Pt
         // no encounters from these tile types
         Elite4_1 = 13, // Elite Four Room #1
         Elite4_2 = 14,
         Elite4_3 = 15,
         Elite4_4 = 16,
         Elite4_M = 17, // Elite Four Champion Room
         DistortionSideways = 18, // Distortion World (not Giratina)
         BattleTower = 19,
         BattleFactory = 20,
         BattleArcade = 21,
         BattleCastle = 22,
         BattleHall = 23,

         Distortion = 24,
         Max_Pt = 25 // unspecific, catch-all for Pt undefined tiles

    static let ValidTileTypes = [GroundTileType.None, GroundTileType.Sand, GroundTileType.Grass, GroundTileType.Rock, GroundTileType.Cave, GroundTileType.Water, GroundTileType.Building, GroundTileType.Marsh, GroundTileType.Max_DP, GroundTileType.Max_Pt, GroundTileType.Distortion]
}
