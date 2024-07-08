//
//  SpeciesForm.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

protocol SpeciesForm {
    var species: Species { get }
    var form: UInt8 { get }
}

protocol SpeciesFormSettable: SpeciesForm {
    var species: Species { get set }
    var form: UInt8 { get set }
}

struct DefaultSpeciesForm: SpeciesForm {
    var species: Species
    var form: UInt8
}
