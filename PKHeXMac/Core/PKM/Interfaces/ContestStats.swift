//
//  ContestStats.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

/// Exposes Contest Stat value setters
protocol ContestStats: ContestStatsReadable {
    var contestCool: UInt8 { get set }
    var contestBeauty: UInt8 { get set }
    var contestCute: UInt8 { get set }
    var contestSmart: UInt8 { get set }
    var contestTough: UInt8 { get set }
    var contestSheen: UInt8 { get set }
}
