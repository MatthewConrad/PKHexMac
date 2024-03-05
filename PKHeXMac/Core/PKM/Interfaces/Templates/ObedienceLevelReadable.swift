//
//  ObedienceLevelReadable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

/// Exposes information about the level the Pokemon was obtained.
protocol ObedienceLevelReadable {
    /// Indicates the level the Pokemon was obtained by the current handler.
    var obedienceLevel: UInt8 { get }
}
