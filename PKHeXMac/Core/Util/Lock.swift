//
//  Lock.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/7/24.
//

import Foundation

func lock<T>(obj: Any, block: () throws -> T) rethrows -> T {
    objc_sync_enter(obj)
    defer {
        objc_sync_exit(obj)
    }
    return try block()
}
