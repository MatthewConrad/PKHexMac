//
//  PersonalTable1.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

struct PersonalTable1: PersonalTable {
    typealias T = PersonalInfo1
    
    private var table: [PersonalInfo1]
    var maxSpecies: Species = Legal.MaxSpeciesID_1

    init(data: [UInt8]) {
        table = []
        
        let size = PersonalInfo1.SIZE
        let count = data.count / size
        
        for i in 0..<count {
            let sliceIndex = i * size
            let slice = Array(data[sliceIndex..<sliceIndex + size])
            table.append(PersonalInfo1(data: slice))
        }
    }
    
    func isSpeciesInGame(species: Species) -> Bool { species < maxSpecies }
    func isPresentInGame(species: Species, form: UInt8) -> Bool {
        form == 0 && isSpeciesInGame(species: species)
    }
    
    func getFormIndex(species: Species, form: UInt8) -> Int {
        isSpeciesInGame(species: species) ? species.rawValue : 0
    }

    subscript(index: Int) -> PersonalInfo1 {
        table[index < table.count ? index : 0]
    }
    
    subscript(species: Species, form: UInt8) -> PersonalInfo1 {
        table[getFormIndex(species: species, form: form)]
    }
    
    func getFormEntry(species: Species, form: UInt8) -> PersonalInfo1 {
        table[getFormIndex(species: species, form: form)]
    }
    
    func isValidTypeCombination(type1: Int, type2: Int) -> Bool {
        return table.contains { $0.isValidTypeCombination(type1: type1, type2: type2) }
    }
    
    /// Checks if the type matches any of the type IDs extracted from the Personal Table used for R/G/B/Y games.
    /// - remark: valid values are 0-8, 20-26
    static func typeIDExists(type: Int) -> Bool {
        type < 32 && (0b111111100000000000110111111 & (1 << type) != 0)
    }
}
