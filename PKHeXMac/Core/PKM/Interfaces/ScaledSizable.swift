//
//  ScaledSizable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/10/24.
//

import Foundation

/// Stores scalars ranging from 0-255
protocol ScaledSizable: ScaledSizeReadable {
    var weightScalar: UInt8 { get set }
    var heightScalar: UInt8 { get set }
}

protocol ScaledSizable3 {
    var scale: UInt8 { get set }
}

/// Stores scalars ranging from 0 to infinity, indicating absolute size
protocol ScaledSizableAbsolute {
    var weightAbsolute: Float { get set }
    var heightAbsolute: Float { get set }
}

/// Exposes methods to calculate and reset the stored size values.
protocol ScaledSizableValue: ScaledSizable, ScaledSizableAbsolute {
    var calcWeightAbsolute: Float { get }
    var calcHeightAbsolute: Float { get }

    func resetWeight()
    func resetHeight()
}

/// Indicates "CP".
/// - remark: Used only in Let's Go P/E
protocol CombatPower {
    var statCP: Int { get set }

    func resetCP()
}
