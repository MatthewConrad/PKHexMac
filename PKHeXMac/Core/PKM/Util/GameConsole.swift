//
//  GameConsole.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

/// Hardware console types
///
/// Related to EntityContext; no need to specify side-game consoles like the N64 as they're tied to the mainline console.
/// Console revisions (like Game Boy Color) or 3DS-XL are not included, again, only care about console limitations that run the games.
enum GameConsole: Int {
    case None, GB, GBA, GC, NDS, _3DS, NX
}
