//
//  EncounterFormRandom.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Interface for `IEncounterTemplate` objects that can be one of many forms.
/// - remark: formerly `IEncounterFormRandom`
protocol RandomFormEncounterable {
    var isRandomUnspecificForm: Bool { get }
}
