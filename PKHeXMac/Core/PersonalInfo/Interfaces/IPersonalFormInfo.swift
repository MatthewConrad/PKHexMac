//
//  IPersonalFormInfo.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/1/24.
//

import Foundation

protocol IPersonalFormInfo {
    /// Count of Forms the PKM can have
    var formCount: Int { get set }
    
    /// Pointer to the first Form Personal Info index
    var formStatsIndex: Int { get set }
    
    /// Indicates if the entry has forms or not
    var hasForms: Bool { get }
    
    /// Gets the PersonalTable Form index for the Species & Form, with fallback for the original Species
    func formIndex(species: Species, form: Int) -> Int
    
    /// Checks if the PersonalInfo has the requested Form entry index available
    func hasForm(form: Int) -> Bool
    
    /// Checks if the Form is valid within the PersonalInfo formCount
    func isFormWithinRange(form: Int) -> Bool
}
