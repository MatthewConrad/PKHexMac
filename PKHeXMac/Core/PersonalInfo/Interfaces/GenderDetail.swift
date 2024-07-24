//
//  GenderDetail.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

protocol GenderDetail {
    var dualGender: Bool { get }
    var genderless: Bool { get }
    var onlyFemale: Bool { get }
    var onlyMale: Bool { get }
}

extension GenderDetail {
    func fixedGender() -> UInt8 {
        return if self.genderless {
            2
        } else if self.onlyFemale {
            1
        } else if self.onlyMale {
            0
        } else {
            255
        }
    }

    /// Gets a random valid gender
    func getRandomGender() -> UInt8 {
        let fixed = self.fixedGender()

        return if fixed < 255 {
            fixed
        } else {
            UInt8.random(in: 0 ... 1)
        }
    }
}
