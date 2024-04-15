//
//  FixedNickname.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Contains information about initial Nickname details
/// - remark: formerly `IFixedNickname`
protocol FixedNickname {
    /// Indicates if the Nickname is specified by the encounter template.
    var isFixedNickname: Bool { get }

    /// Checks if the specified nickname matches the encounter template
    func isNicknameMatch(pk: PKMProtocol, nickname: String, language: Int) -> Bool

    /// Gets the nickname for the specified language.
    func getNickname(language: Int) -> String
}
