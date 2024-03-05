//
//  MemoryOTReadable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

protocol MemoryOTReadable {
    var originalTrainerMemory: UInt8 { get }
    var originalTrainerMemoryIntensity: UInt8 { get }
    var originalTrainerMemoryFeeling: UInt8 { get }
    var originalTrainerMemoryVariable: UInt16 { get }
}
