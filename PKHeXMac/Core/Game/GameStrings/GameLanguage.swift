//
//  GameLanguage.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/7/24.
//

import Foundation

enum GameLanguage {
    /// Language codes supported for loading string resources
    static let LanguageCodes: [String] = ["ja", "en", "fr", "it", "de", "es", "ko", "zh", "zh2"]

    /// Pokétransporter location names, ordered per index of `LanguageCodes`
    static let ptransp: [String] = ["ポケシフター", "Poké Transfer", "Poké Fret", "Pokétrasporto", "Poképorter", "Pokétransfer", "포케시프터", "宝可传送", "寶可傳送"]

    static let DefaultLanguage = "en"
    static let DefaultLanguageIndex = 1

    static var LanguageCount: Int {
        return LanguageCodes.count
    }

    /// Gets the index of a given language.
    /// - parameters:
    ///   - lang: a valid LanguageCode
    /// - returns: the index of the language code, or `DefaultLanguageIndex` as a fallback
    static func GetLanguageIndex(lang: String) -> Int {
        return LanguageCodes.firstIndex(of: lang) ?? DefaultLanguageIndex
    }

    /// Gets the Met Location display name for the PokeTransporter
    /// - parameters:
    ///   - index: an index of LanguageCodes
    /// - returns: a PokeTransporter location name
    static func GetTransporterName(index: Int) -> String {
        return if index < 0 || index >= ptransp.count {
            ptransp[2]
        } else {
            ptransp[index]
        }
    }

    /// Gets the Met Location display name for the PokeTransporter
    /// - parameters:
    ///   - lang: a LanguageCode
    /// - returns: a PokeTransporter location name
    static func GetTransporterName(lang: String) -> String {
        return GetTransporterName(index: GetLanguageIndex(lang: lang))
    }

    /// Gets a list of strings for the specified language and file type
    static func GetStrings(id: String, lang: String, type: String = "text") -> [String] {
        // TODO: implement after Core/Util/ResourceUtil

        return []
    }
}
