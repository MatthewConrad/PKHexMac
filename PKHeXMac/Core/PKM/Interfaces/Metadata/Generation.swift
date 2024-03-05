//
//  Generation.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

/// Exposes a Generation to see which canonical generation the data originated in
protocol Generation {
    var generation: UInt8 { get }
}
