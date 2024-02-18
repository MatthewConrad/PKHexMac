//
//  LocationRemapState.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/18/24.
//

import Foundation

struct LocationRemapState: OptionSet {
    let rawValue: Int
    
    static let None = LocationRemapState([])
    static let Original = LocationRemapState(rawValue: 1 << 0)
    static let Remapped = LocationRemapState(rawValue: 1 << 1)
    static let Either: LocationRemapState = [.Original, .Remapped]
}
