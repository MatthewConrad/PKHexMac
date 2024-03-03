//
//  PersonalTR.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

protocol PersonalTR {
    func isLearnTR(index: Int) -> Bool
    func setLearnTR(index: Int, value: Bool)
}
