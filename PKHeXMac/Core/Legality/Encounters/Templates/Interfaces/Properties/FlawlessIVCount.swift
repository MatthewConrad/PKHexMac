//
//  FlawlessIVCount.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Contains info about the number of perfect IVs the object has.
/// - remark: formerly `IFlawlessIVCount`
protocol FlawlessIVCount {
    var flawlessIVCount: UInt8 { get }
}

/// Contains info about the number of perfect IVs the object originates with.
/// - remark: formerly `IFlawlessIVCountConditional`
protocol FlawlessIVCountConditional {
    func getFlawlessIVCount(pk: PKMProtocol) -> (min: UInt8, max: UInt8)
}
