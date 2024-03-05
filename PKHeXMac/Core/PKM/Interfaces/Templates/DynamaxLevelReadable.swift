//
//  DynamaxLevelReadable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

protocol DynamaxLevelReadable {
    var dynamaxLevel: UInt8 { get }
}

extension DynamaxLevelReadable {
    func canHaveDynamaxLevel(pk: PKM) -> Bool {
        return if pk.isEgg {
            false
        } else {
            // TODO: update when have PK8
            pk is PKM || Self.canHaveDynamaxLevel(species: pk.species)
        }
    }

    static func canHaveDynamaxLevel(species: Species) -> Bool {
        ![.Zacian, .Zamazenta, .Eternatus].contains(species)
    }

    func getSuggestedDynamaxLevel(pk: PKM, requested: UInt8 = 10) -> UInt8 {
        self.canHaveDynamaxLevel(pk: pk) ? requested : 0
    }
}
