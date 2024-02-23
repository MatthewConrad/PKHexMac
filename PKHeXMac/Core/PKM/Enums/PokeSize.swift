//
//  PokeSize.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

enum PokeSize {
    case XS, S, AV, L, XL
}

class PokeSizeUtil {
    func getSizeRating(scalar: Int) -> PokeSize {
        return if scalar < 0x10 {
            PokeSize.XS
        } else if scalar < 0x30 {
            PokeSize.S
        } else if scalar < 0xd0 {
            PokeSize.AV
        } else if scalar < 0xf0 {
            PokeSize.L
        } else {
            PokeSize.XL
        }
    }

    func getRandomScalar() -> Int {
        return Int.random(in: 0..<0x81) + Int.random(in: 0..<0x80)
    }

    func getRandomScalar(size: PokeSize) -> Int {
        return if size == PokeSize.XS {
            Int.random(in: 0..<0x10)
        } else if size == PokeSize.S {
            Int.random(in: 0..<0x20) + 0x10
        } else if size == PokeSize.AV {
            Int.random(in: 0..<0xa0) + 0x30
        } else if size == PokeSize.L {
            Int.random(in: 0..<0x20) + 0xd0
        } else if size == PokeSize.XL {
            Int.random(in: 0..<0x10) + 0xf0
        } else {
            getRandomScalar()
        }
    }
}
