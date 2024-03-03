//
//  PersonalTM.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

protocol PersonalTM {
    func isLearnTM(index: Int) -> Bool
    func setLearnTM(index: Int, value: Bool)
}
