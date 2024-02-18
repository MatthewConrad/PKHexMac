//
//  ILocationSet.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/11/24.
//

import Foundation

protocol ILocationSet {
    
    /// Gets the location name group for the requested location bank group ID.
    func GetLocationNames (bankId: Int) -> [String]
    
    /// Gets the location name for the requested LocationID
    func GetLocationName (locationId: Int) -> String
    
    func GetAll() -> [Int:[String]]
}
