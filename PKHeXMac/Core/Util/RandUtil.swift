//
//  RandUtil.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 5/5/24.
//

import Foundation

enum RandUtil {
    static func rand32() -> UInt32 {
        (UInt.random(in: 0..<(1 << 30)) << 2) | UInt.random(in: 0..<(1 << 2))
    }

    static func rand64() -> UInt64 {
        self.rand32 | UInt64(self.rand32() << 32)
    }
}
