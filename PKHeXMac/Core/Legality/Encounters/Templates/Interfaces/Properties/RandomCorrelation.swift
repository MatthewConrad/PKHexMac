//
//  RandomCorrelation.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/15/24.
//

import Foundation

/// Interface for a random `PIDType` correlation.
/// - remark: formerly `IRandomCorrelation`
protocol RandomCorrelation {
    func isCompatible(val: PIDType, pk: PKMProtocol)

    func getSuggestedCorrelation() -> PIDType
}
