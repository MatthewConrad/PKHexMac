//
//  LangNicknamedTemplate.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

protocol LangNicknamedTemplate {
    func getNickname(language: Int) -> String
    func getIsNicknamed(language: Int) -> Bool

    func canBeAnyLanguage() -> Bool
    func canHaveLanguage(language: Int) -> Bool
    func canHandleOT(language: Int) -> Bool
}
