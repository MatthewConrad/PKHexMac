//
//  LocationSet0.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/11/24.
//

import Foundation

/// Gen 2-3 specific met location name holder
/// - remark: Single segment, no shift bias
struct LocationSet0: LocationSet {
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
