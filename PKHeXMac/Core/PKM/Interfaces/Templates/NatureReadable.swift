//
//  NatureReadable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

/// Exposes information about the Pokemon's Nature
protocol NatureReadable {
    
    /// The Pokemon's Nature
    var nature: Nature { get }
}
