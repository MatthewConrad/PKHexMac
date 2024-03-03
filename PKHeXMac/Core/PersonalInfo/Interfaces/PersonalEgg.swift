//
//  PersonalEgg.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/3/24.
//

import Foundation

protocol PersonalEgg {
    var group1: Int { get set }
    var group2: Int { get set }
}

extension PersonalEgg {
    func isInEggGroup(group: Int) -> Bool {
        self.group1 == group || self.group2 == group
    }
}
