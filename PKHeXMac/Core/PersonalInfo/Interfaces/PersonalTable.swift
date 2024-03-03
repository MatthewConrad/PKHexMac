//
//  PersonalTable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

/// Exposes info about all PersonalInfo in the object.
protocol PersonalTable {
    associatedtype T: PersonalInfo
    
    var maxSpecies: Species { get }

    /// Gets an index from the inner array.
    /// - remark: Should have built in length checks, returning empty entry if out of range.
    subscript(index: Int) -> T { get }
    
    /// Alternate way of fetching getFormEntry
    subscript(species: Species, form: Int) -> T { get }
    
    /// Gets the PersonalInfo entry index for a given species and form
    func getFormIndex(species: Species, form: Int) -> Int
    
    /// Gets the PersonalInfo entry for a given species and form
    func getFormEntry(species: Species, form: Int) -> T
    
    func isSpeciesInGame(species: Species) -> Bool
    func isPresentInGame(species: Species, form: Int) -> Bool
}
