//
//  LangNick.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

protocol LangNick {
    var nickname: String { get }
    var isNicknamed: Bool { get }
    var language: Int { get }
}
