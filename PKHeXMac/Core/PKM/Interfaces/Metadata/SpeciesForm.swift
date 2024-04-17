//
//  SpeciesForm.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

protocol SpeciesForm {
    var species: Species { get }
    // TODO: convert to UInt8
    var form: Int { get }
}
