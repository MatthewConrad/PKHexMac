//
//  PokeblockFlavor.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

enum PokeblockFlavor: Int {
    case Spicy = 0,
         Sour,
         Sweet,
         Dry,
         Bitter

    private static let flavors = 5

    /// Initializes a PokeblockFlavor from a raw int value, re-mapping out-of-bounds values to `.Spicy`
    init(fromInt: Int) {
        self = PokeblockFlavor(rawValue: fromInt) ?? .Spicy
    }

    static func getLikedBlockFlavor(nature: Nature) -> PokeblockFlavor {
        PokeblockFlavor(fromInt: nature.rawValue / flavors)
    }
    static func getDislikedBlockFlavor(nature: Nature) -> PokeblockFlavor {
        PokeblockFlavor(fromInt: nature.rawValue % flavors)
    }
}
