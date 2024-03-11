//
//  FatefulEncounter.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

/// Exposes whether tagged as a "Fateful Encounter"
protocol FatefulEncounterable: FatefulEncounterReadable {
    var fatefulEncounter: Bool { get set }
}
