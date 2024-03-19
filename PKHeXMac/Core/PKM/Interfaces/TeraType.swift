//
//  TeraType.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/18/24.
//

import Foundation

enum TeraType {
    static let maxType: MoveType = .Fairy

    /// Fallback for out-of-range type values
    static let fallback: MoveType = .Normal

    static let stellarTypeDisplayStringIndex: UInt8 = 18

    /// Indicates if Tera Type is valid (changed to anything)
    static func isOverrideValid(override: MoveType) -> Bool {
        override <= maxType || override == .Stellar
    }

    /// Indicates if Tera Type is valid (changed from anything to anything)
    static func isValid(override: MoveType) -> Bool {
        isOverrideValid(override: override) || override == .OverrideNone
    }

    /// Checks if Ogerpon's Tera Type is valid
    static func isValidOgerpon(type: MoveType, form: UInt8) -> Bool {
        let adjusted = form & 3
        switch adjusted {
        case 0:
            return type == MoveType.Grass || type == .OverrideNone
        case 1:
            return type == MoveType.Water
        case 2:
            return type == MoveType.Fire
        case 3:
            return type == MoveType.Rock
        default:
            return false
        }
    }

    /// Checks if Terapagos' Tera Type is valid
    static func isValidTerapagos(type: MoveType) -> Bool {
        type == .OverrideNone
    }

    /// Checks if the given species can have its Tera Type changed
    static func canChangeTeraType(species: Species) -> Bool {
        ![.Ogerpon, .Terapagos].contains(species)
    }

    /// Calculates the effective Tera Type based on original and override inputs.
    static func getTeraType(original: MoveType, override: MoveType) -> MoveType {
        return if isOverrideValid(override: override) {
            override
        } else if override != .OverrideNone {
            fallback
        } else if original <= .Stellar {
            original
        } else {
            fallback
        }
    }

    /// Gets the preferred Tera Type to set for the given `PersonalType`
    static func getTeraTypeImport(type1: UInt8, type2: UInt8) -> MoveType {
        let type = MoveType(rawValue: Int(type1)) ?? MoveType.Normal
        let secondaryType = MoveType(rawValue: Int(type2)) ?? MoveType.Normal
        return type != .Normal ? type : secondaryType
    }
}

protocol TeraTypeReadable {
    var teraType: MoveType { get }
}

protocol TeraTypeSettable: TeraTypeReadable {
    /// Tera Type value the entity is originally encountered with
    var teraTypeOriginal: MoveType { get set }

    /// If the type was modified, this value will indicate accordingly
    var teraTypeOverride: MoveType { get set }
}

extension TeraTypeSettable {
    func getTeraType() -> MoveType {
        TeraType.getTeraType(original: teraTypeOriginal, override: teraTypeOverride)
    }

    mutating func setTeraType(type: MoveType) {
        let typeStellarAdjusted = type > .Stellar ? TeraType.fallback : type

        if teraTypeOriginal == typeStellarAdjusted {
            teraTypeOverride = .OverrideNone
        } else {
            teraTypeOverride = typeStellarAdjusted
        }
    }
    
    // TODO: implement resetTeraType
}
