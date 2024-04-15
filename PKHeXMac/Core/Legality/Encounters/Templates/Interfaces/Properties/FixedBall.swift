//
//  FixedBall.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Exposes details about an encounter with a specific ball ID required
/// - remark: formerly `IFixedBall`
protocol FixedBall {
    /// Specific Ball ID that is required from this object.
    /// - remark: If `Ball.None`, no specific ball is required, but must be one of the permitted balls.
    var fixedBall: Ball { get }
}
