//
//  Version.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

protocol Version {
    var version: GameVersion { get }
}

extension Version {
    func canBeReceivedBy(game: GameVersion) -> Bool {
        self.version.contains(game: game)
    }

    func getSingleVersion() -> GameVersion {
        self.version.getSingleVersion()
    }

    func getCompatibleVersion(prefer: GameVersion) -> GameVersion {
        return if self.canBeReceivedBy(game: prefer) || self.version == .AnyGame {
            prefer
        } else {
            self.getSingleVersion()
        }
    }
}
