//
//  CaughtData2.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

/// Met data interface for details introduced by `GameVersion.C` in Gen 2
protocol CaughtData2 {
    var caughtData: UInt16 { get set }
    var metTimeOfDay: Int { get set }
    var metLevel: UInt8 { get set }
    var originalTrainerGender: UInt8 { get set }
    var metLocation: UInt16 { get set }
}
