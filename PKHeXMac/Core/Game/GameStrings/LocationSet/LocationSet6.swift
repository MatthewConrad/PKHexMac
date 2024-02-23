//
//  LocationSet6.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/11/24.
//

import Foundation

struct LocationSet6: ILocationSet {
    var Met0: [String] = []
    var Met3: [String] = []
    var Met4: [String] = []
    var Met6: [String] = []

    func GetLocationNames(bankId: Int) -> [String] {
        switch bankId {
        case 0:
            return Met0
        case 3:
            return Met3
        case 4:
            return Met4
        case 6:
            return Met6
        default:
            return []
        }
    }

    func Get(names: [String], index: Int) -> String {
        return if index >= names.count {
            ""
        } else {
            names[index]
        }
    }

    func GetLocationName(locationId: Int) -> String {
        return if locationId >= 60000 {
            Get(names: Met6, index: locationId-60000)
        } else if locationId >= 40000 {
            Get(names: Met4, index: locationId-40000)
        } else if locationId >= 30000 {
            Get(names: Met3, index: locationId-30000)
        } else {
            Get(names: Met0, index: locationId)
        }
    }

    func GetAll() -> [Int: [String]] {
        return [0: Met0, 3: Met3, 4: Met4, 6: Met6]
    }
}
