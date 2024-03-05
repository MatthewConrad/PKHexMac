//
//  Meetable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

protocol Meetable {
    var metLocation: UInt16 { get set }

    var metDay: UInt8 { get set }
    var metMonth: UInt8 { get set }
    var metYear: UInt8 { get set }

    var metDate: Optional<DateComponents> { get set }
}

extension Meetable {
    var metDay: UInt8 {
        get { 0 }
        set {}
    }

    var metMonth: UInt8 {
        get { 0 }
        set {}
    }

    var metYear: UInt8 {
        get { 0 }
        set {}
    }

    // TODO: possibly revisit this; dates suck in Swift too, who's surprised
    var metDate: Optional<DateComponents> {
        get {
            let year = 2000 + Int(metYear)
            let date = DateComponents(year: year, month: Int(metMonth), day: Int(metDay))

            return if date.isValidDate {
                date
            } else {
                nil
            }
        }

        set {
            let year = newValue?.year ?? 0

            metYear = UInt8(year > 0 ? year - 2000 : 0)
            metMonth = UInt8(newValue?.month ?? 0)
            metDay = UInt8(newValue?.day ?? 0)
        }
    }
}
