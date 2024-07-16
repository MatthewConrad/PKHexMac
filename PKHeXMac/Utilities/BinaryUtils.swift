//
//  BinaryUtils.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 7/15/24.
//

import Foundation

enum BinaryUtils {
    static func readUInt16LittleEndian(_ data: Data) -> UInt16 {
        data.withUnsafeBytes {
            $0.load(as: UInt16.self).littleEndian
        }
    }
}
