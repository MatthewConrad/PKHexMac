//
//  ShadowCapturable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/18/24.
//

import Foundation

/// Exposes Shadow details for the entity.
/// - remark: Used only for Colosseum/XD Pokemon that were shadow encounters.
protocol ShadowCapturable {
    var shadowID: UInt16 { get set }
    var purification: Int { get set }
    var isShadow: Bool { get set }
}
