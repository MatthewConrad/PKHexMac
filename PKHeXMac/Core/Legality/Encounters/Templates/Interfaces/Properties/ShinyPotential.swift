//
//  ShinyPotential.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/15/24.
//

import Foundation

/// Exposes a shiny potential state indicating what kinds of `Shiny` can be expressed
/// - remark: formerly `IShinyPotential`
protocol ShinyPotential {
    var shiny: Shiny { get }
}
