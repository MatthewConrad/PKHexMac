//
//  GameUtil.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/6/24.
//

import Foundation

class GameUtil {
    
    func IsValidSavedVersion (game: GameVersion) -> Bool {
        return game > GameVersion.AnyGame && game < GameVersion.HighestGameId
    }
    
    func GetValidGameVersions() -> [GameVersion] {
        let valid = GameVersion.allCases.filter({ IsValidSavedVersion(game: $0) })
        return valid.reversed()
    }
}
