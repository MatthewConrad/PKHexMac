//
//  OriginMark.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

enum OriginMark {
    case None, Gen6Pentagon, Gen7Clover, Gen8Galar, Gen8Trio, Gen8Arc, Gen9Paldea, GameBoy, GO, LetsGo

    static func getOriginMark(pk: PKMProtocol) -> OriginMark {
        return if pk.VC {
            .GameBoy
        } else if pk.GO {
            .GO
        } else if pk.LGPE {
            .LetsGo
        } else if pk.Gen6 {
            .Gen6Pentagon
        } else if pk.Gen7 {
            .Gen7Clover
        } else if pk.SWSH {
            .Gen8Galar
        } else if pk.BDSP {
            .Gen8Trio
        } else if pk.LA {
            .Gen8Arc
        } else if pk.SV {
            .Gen9Paldea
        } else {
            .None
        }
    }
}
