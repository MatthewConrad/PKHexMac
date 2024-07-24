//
//  EvolutionSet.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/15/24.
//

import Foundation

/// Evolution Branch Binary Unpacker
enum EvolutionSet {
    static let SIZE: Int = 8

    static func getArray(data: Data, levelUp: UInt8 = 1) -> [[EvolutionMethod]] {
        var result: [[EvolutionMethod]] = Array(repeating: [], count: data.count)

        for i in 0 ..< result.count {
            result[i] = getEntry(data: data[i ..< i + 1], levelUp: levelUp)
        }

        return result
    }

    private static func getEntry(data: Data, levelUp: UInt8) -> [EvolutionMethod] {
        if data.count == 0 {
            return []
        }

        var result: [EvolutionMethod] = Array(repeating: EvolutionMethod(), count: data.count / SIZE)

        let offset = 0
        for i in 0 ..< result.count {
            result[i] = getMethod(entry: data[offset ..< offset + SIZE], levelUp: levelUp)
        }

        return result
    }

    private static func getMethod(entry: Data, levelUp: UInt8) -> EvolutionMethod {
        let type = EvolutionType(rawValue: entry[0]) ?? .UNUSED
        let arg = BinaryUtils.readUInt16LittleEndian(entry[2 ..< 4])

        let species = Species(rawValue: Int(BinaryUtils.readUInt16LittleEndian(entry[4 ..< 6]))) ?? .None
        let form: UInt8 = Array(entry[6 ..< 7])[0]

        let level: UInt8 = Array(entry[7 ..< 8])[0]
        let levelUp: UInt8 = type.isLevelUpRequired() ? levelUp : 0

        return EvolutionMethod(species: species, form: form, argument: arg, method: type, level: level, levelUp: levelUp)
    }
}
