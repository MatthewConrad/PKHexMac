//
//  Affection.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

protocol Affection {
    var originalTrainerAffection: UInt8 { get set }
    var handlingTrainerAffection: UInt8 { get set }
}
