//
//  EvolutionReverseLookup.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/8/24.
//

import Foundation

struct EvolutionReverseLookup: EvolutionLookup {
    var maxSpecies: Species

    let extraBufferFraction: Int = 3 // magic number that gives minimal-ish alloc
    var nodes: [EvolutionNode] {
        Array(repeating: EvolutionNode(first: EvolutionLink(), second: EvolutionLink()), count: maxSpecies.rawValue + (maxSpecies.rawValue >> extraBufferFraction))
    }

    var keyLookup: [Int: Int]

    init(maxSpecies: Species) {
        self.maxSpecies = maxSpecies
        self.keyLookup = [:]
    }

    private func register(link: EvolutionLink, index: Int) {
        var node = nodes[index]
        node.add(newLink: link)
    }

    public mutating func register(link: EvolutionLink, species: Species, form: UInt8) {
        if form == 0 {
            register(link: link, index: species.rawValue)
        } else {
            let index = getOrAppendIndex(species: species, form: form)
            register(link: link, index: index)
        }
    }

    private mutating func getOrAppendIndex(species: Species, form: UInt8) -> Int {
        let key = EvolutionReverseLookup.getKey(species: species, form: form)

        let index = keyLookup.index(forKey: key)
        if index != nil {
            return keyLookup.distance(from: keyLookup.startIndex, to: index!)
        }

        let newIndex = nodes.count - keyLookup.count - 1
        keyLookup.updateValue(newIndex, forKey: key)
        return newIndex
    }

    private func getIndex(species: Species, form: UInt8) -> Int {
        if species > maxSpecies {
            return 0
        } else if form == 0 {
            return species.rawValue
        }

        let key = EvolutionReverseLookup.getKey(species: species, form: form)
        return keyLookup[key] ?? 0
    }

    private static func getKey(species: Species, form: UInt8) -> Int {
        species.rawValue | Int(form) << 11
    }

    subscript(species: Species, form: UInt8) -> EvolutionNode {
        nodes[getIndex(species: species, form: form)]
    }
}
