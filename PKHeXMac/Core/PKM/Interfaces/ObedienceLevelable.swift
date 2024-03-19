//
//  ObedienceLevelable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/18/24.
//

import Foundation

protocol ObedienceLevelable: ObedienceLevelReadable {
    var obedienceLevel: UInt8 { get set }
}

extension ObedienceLevelable {
    func getSuggestedObedienceLevel(pk: PKMProtocol, originalMet: Int) -> UInt8 {
        // Box Legend ride-able is default 0;  everything else is met level
        return if [.Koraidon, .Miraidon].contains(pk.species) && pk.form != 0 {
            0
        } else if ![.SL, .VL].contains(pk.version) {
            0 // TODO: implement pk.currentLevel
        } else {
            UInt8(originalMet) // can assume min-level
        }
    }
}
