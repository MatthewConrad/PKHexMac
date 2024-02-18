//
//  LocationSet4.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/11/24.
//

import Foundation

struct LocationSet4: ILocationSet {
    var Met0: [String] = []
    var Met2: [String] = []
    var Met3: [String] = []
    
    func GetLocationNames(bankId: Int) -> [String] {
        switch bankId{
        case 0:
            return Met0
        case 2:
            return Met2
        case 3:
            return Met3
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
        return if locationId >= 3000 {
            Get(names: Met3, index: locationId-3000)
        } else if locationId >= 2000 {
            Get(names: Met2, index: locationId-2000)
        } else {
            Get(names: Met0, index: locationId)
        }
    }
    
    func GetAll() -> [Int : [String]] {
        return [ 0: Met0, 2: Met2, 3: Met3]
    }
}
