//
//  FormChangeUtil.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/29/24.
//

import Foundation

/// Logic for checking if an entity can freely change Form
struct FormChange {
    private static let FormChangeMovesRetain: [Species] = [.Deoxys, .Giratina, .Shaymin, .Hoopa]

    private func iterateAllForms(species: Species) -> Bool {
        return FormChange.FormChangeMovesRetain.contains(species)
    }

    /// Species that can change between their forms and get access to form-specific moves
    private func isFormChangeDifferentMoves(species: Species, generation: Int) -> Bool {
        switch species {
        case
            .Deoxys, .Giratina, .Shaymin, .Rotom, .Hoopa,
            .Tornadus, .Thundurus, .Landorus, .Kyurem, .Pikachu:
            return generation >= 6
        case .Urshifu, .Enamorus, .Necrozma, .Calyrex:
            return generation >= 8
        default:
            return false
        }
    }

    /// Checks if all forms should be iterated when checking for Moves
    /// - parameters:
    ///     - species: the Entity Species
    ///     - form: the Entity form
    ///     - generation: the generation being checked
    ///     - option: LearnOption conditions being used
    func shouldIterateForms(species: Species, form: Int, generation: Int, option: LearnOption) -> Bool {
        return if option.isPast() {
            isFormChangeDifferentMoves(species: species, generation: generation)
        } else {
            iterateAllForms(species: species)
        }
    }
}
