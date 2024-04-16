//
//  RestrictVersion.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/15/24.
//

import Foundation

protocol RestrictVersion {
    func canBeReceivedByVersion(version: GameVersion) -> Bool
}
