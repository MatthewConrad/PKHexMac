//
//  HandlerLanguage.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/10/24.
//

import Foundation

/// Exposes info about the latest handler (not the OT) language
protocol HandlerLanguage {
    var HandlingTrainerLanguage: UInt8 { get set }
}
