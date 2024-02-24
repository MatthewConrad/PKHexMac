//
//  PokeSize.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

enum PokeSize {
    case XS, S, AV, L, XL
    
    static func getSizeRating(scalar: Int) -> PokeSize {
        return if scalar < 0x10 {
            .XS
        } else if scalar < 0x30 {
            .S
        } else if scalar < 0xd0 {
            .AV
        } else if scalar < 0xf0 {
            .L
        } else {
            .XL
        }
    }

    static func getRandomScalar() -> Int {
        return Int.random(in: 0..<0x81) + Int.random(in: 0..<0x80)
    }

    static func getRandomScalar(size: PokeSize) -> Int {
        return if size == .XS {
            Int.random(in: 0..<0x10)
        } else if size == .S {
            Int.random(in: 0..<0x20) + 0x10
        } else if size == .AV {
            Int.random(in: 0..<0xa0) + 0x30
        } else if size == .L {
            Int.random(in: 0..<0x20) + 0xd0
        } else if size == .XL {
            Int.random(in: 0..<0x10) + 0xf0
        } else {
            PokeSize.getRandomScalar()
        }
    }
}
