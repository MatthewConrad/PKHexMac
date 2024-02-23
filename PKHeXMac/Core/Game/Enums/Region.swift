//
//  Region3DSIndex.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/6/24.
//

import Foundation

enum GCRegion: Int {
    case NoRegion = 0, NTSC_J = 1, NTSC_U = 2, PAL = 3
}

/// 3DS Console Region Identifiers used for Generation 6 & 7 Mystery Gifts
enum Region3DSIndex: Int, CaseIterable, Comparable {
    case None = 0,
         Japan = 1,
         NorthAmerica = 2,
         Europe = 3,
         China = 4,
         Korea = 5,
         Taiwan = 6

    static func < (lhs: Region3DSIndex, rhs: Region3DSIndex) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
