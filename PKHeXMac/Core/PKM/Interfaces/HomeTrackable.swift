//
//  HomeTrackable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/10/24.
//

import Foundation

protocol HomeTrackable {
    var tracker: UInt64 { get set }
    var hasTracker: Bool { get }
}

extension HomeTrackable {
    var hasTracker: Bool {
        self.tracker != 0
    }
}
