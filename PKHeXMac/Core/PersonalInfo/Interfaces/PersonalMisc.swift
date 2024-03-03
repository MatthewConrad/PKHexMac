//
//  PersonalMisc.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

/// Miscellaneous metadata about an entity species / form.
protocol PersonalMisc {
    var evoStage: Int { get set }

    /// Main color ID of the entry; usually the majority of the Pokemon's color is this colo
    var color: Int { get set }

    /// Stats are in metric, Meters and Kilograms
    var height: Int { get set }
    var wight: Int { get set }
}
