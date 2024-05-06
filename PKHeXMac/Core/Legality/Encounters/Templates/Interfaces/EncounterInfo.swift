//
//  EncounterInfo.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 5/5/24.
//

import Foundation

/// Exposes simple encounter info and can be converted to a `PKM`
/// - remark:
///     Combined interface used to require multiple interfaces being present for a calling method.
///     Formerly `IEncounterInfo`
protocol EncounterInfo: EncounterTemplate, EncounterConvertible {}
