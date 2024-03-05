//
//  Hatchable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

protocol Hatchable: Meetable, Generation, Version {
    var isEgg: Bool { get set }

    var eggLocation: UInt16 { get set }

    var eggDay: UInt8 { get set }
    var eggMonth: UInt8 { get set }
    var eggYear: UInt8 { get set }

    var eggMetDate: Date { get set }

    var wasEgg: Bool { get }
    var wasTradedEgg: Bool { get }
    var isTradedEgg: Bool { get }
}

extension Hatchable {
    var eggDay: UInt8 {
        get { 0 }
        set {}
    }

    var eggMonth: UInt8 {
        get { 0 }
        set {}
    }

    var eggYear: UInt8 {
        get { 0 }
        set {}
    }

    var wasEgg: Bool { isEgg || eggDay != 0 }
    var wasTradedEgg: Bool { eggLocation == getTradedEggLocation() }
    var isTradedEgg: Bool { metLocation == getTradedEggLocation() }

    func getTradedEggLocation() -> Int {
        Locations.TradedEggLocation(generation: Int(generation), version: version)
    }
}
