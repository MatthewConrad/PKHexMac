//
//  FormItem.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/1/24.
//

import Foundation

/// Logic for relating Forms and the Held Item
enum FormItem {
    private static let arceusPlateIDs: [Int] = [
        303, 306, 304, 305, 309, 308, 310, 313, 298, 299, 301, 300, 307, 302, 311, 312, 644
    ]

    private static let arceusZCrystal: [Int] = [
        782, 785, 783, 784, 788, 787, 789, 792, 777, 778, 780, 779, 786, 781, 790, 791, 793
    ]

    /// Gets the form for Arceus based on the held Z Crystal
    func getFormArceusZCrystal(item: Int) -> Int {
        return (FormItem.arceusZCrystal.firstIndex(of: item) ?? -1) + 1
    }

    /// Gets the form for Arceus based on the held plate
    func getFormArceusPlate(item: Int, format: Int) -> Int {
        let form = (FormItem.arceusPlateIDs.firstIndex(of: item) ?? -1) + 1

        return if format != 4 {
            form
        } else if form < 9 {
            form
        } else {
            form + 1
        }
    }

    func getFormArceus(item: Int, format: Int) -> Int {
        return if (777...793).contains(item) {
            getFormArceusZCrystal(item: item)
        } else if (298...313).contains(item) || item == 644 {
            getFormArceusPlate(item: item, format: format)
        } else {
            0
        }
    }

    func getItemArceus(form: Int, format: Int) -> Int {
        var index = form - 1
        if format == 4 && form > 8 {
            index = index - 1
        }

        return if index >= FormItem.arceusPlateIDs.count {
            0
        } else {
            FormItem.arceusPlateIDs[index]
        }
    }

    func getFormGenesect(item: Int) -> Int {
        return if (116...119).contains(item) {
            item - 115
        } else {
            0
        }
    }

    func getItemGenesect(form: Int) -> Int {
        return if (1...4).contains(form) {
            form + 115
        } else {
            0
        }
    }

    func getFormSilvally(item: Int) -> Int {
        return if (904...920).contains(item) {
            item - 903
        } else {
            0
        }
    }

    func getItemSilvally(form: Int) -> Int {
        return if (1...17).contains(form) {
            form + 903
        } else {
            0
        }
    }

    func getFormOgerpon(item: Int) -> Int {
        switch item {
        case 2407:
            return 1 // Wellspring Mask
        case 2408:
            return 2 // Hearthflame Mask
        case 2406:
            return 3 // Cornerstone Mask
        default:
            return 0
        }
    }

    func getItemOgerpon(form: Int) -> Int {
        switch form {
        case 1:
            return 2407 // Wellspring Mask
        case 2:
            return 2408 // Hearthflame Mask
        case 3:
            return 2406 // Cornerstone Mask
        default:
            return 0
        }
    }

    func getItem(species: Species, form: Int) -> Int {
        switch species {
        case .Arceus:
            return getItemArceus(form: form, format: 8)
        case .Genesect:
            return getItemGenesect(form: form)
        case .Silvally:
            return getItemSilvally(form: form)
        case .Ogerpon:
            return getItemOgerpon(form: form)
        default:
            return 0
        }
    }

    func tryGetForm(species: Species, item: Int, format: Int) -> (Int, Bool) {
        switch species {
        case .Arceus:
            return (getFormArceus(item: item, format: format), true)
        case .Genesect:
            return (getFormGenesect(item: item), true)
        case .Silvally:
            return (getFormSilvally(item: item), true)
        case .Ogerpon:
            return (getFormOgerpon(item: item), true)
        default:
            return (0, false)
        }
    }
}
