//
//  DynamaxLevel.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

/// Exposes info about Dynamax potential.
protocol DynamaxLevelable: DynamaxLevelReadable {
    var dynamaxLevel: UInt8 { get set }
}
