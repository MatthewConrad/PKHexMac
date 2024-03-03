//
//  PersonalTutorType.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

protocol PersonalTutorType {
    func isLearnTutorType(index: Int) -> Bool
    func setLearnTutorType(index: Int, value: Bool)
}
