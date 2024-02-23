//
//  LocationSet0.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/11/24.
//

import Foundation

struct LocationSet0: ILocationSet {
    var Met0: [String] = []

    func GetLocationNames(bankId: Int) -> [String] {
        switch bankId {
        case 0:
            return Met0
        default:
            return []
        }
    }

    func GetLocationName(locationId: Int) -> String {
        return if locationId >= Met0.count {
            ""
        } else {
            Met0[locationId]
        }
    }

    func GetAll() -> [Int: [String]] {
        return [0: Met0]
    }
}
