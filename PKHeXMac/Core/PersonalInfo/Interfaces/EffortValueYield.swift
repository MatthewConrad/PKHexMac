//
//  EffortValueYield.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

/// Exposes details about effort values yielded on defeat / capture.
protocol EffortValueYield {
    var EV_HP: Int { get set }
    var EV_ATK: Int { get set }
    var EV_DEF: Int { get set }
    var EV_SPA: Int { get set }
    var EV_SPD: Int { get set }
    var EV_SPE: Int { get set }
}
