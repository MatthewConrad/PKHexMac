//
//  LanguageID.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/6/24.
//

import Foundation

enum LanguageID: Int, CaseIterable, Comparable {
    case
    /// Undefined Language ID, usually indicative of a value not being set. Gen5 Japanese In-game Trades happen to not have their Language value set, and express Language=0.
    Hacked = 0,

    /// Japanese (日本語)
    Japanese = 1,

    /// English (US/UK/AU)
    English = 2,

    /// French (Français)
    French = 3,
    
    /// Italian (Italiano)
    Italian = 4,

    /// German (Deutsch)
    German = 5,

    /// Unused Language ID. Was reserved for Korean in Gen3 but never utilized.
    UNUSED_6 = 6,
    
    /// Spanish (Español)
    Spanish = 7,
    
    /// Korean (한국어)
    Korean = 8,
    
    /// Chinese Simplified (简体中文)
    ChineseS = 9,
    
    /// Chinese Traditional (繁體中文)
    ChineseT = 10
    
    static func < (lhs: LanguageID, rhs: LanguageID) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    /// Converts `LanguageID`  to `LanguageGC`.
    func toLanguageGC() -> LanguageGC {
        switch self {
        case .Hacked:
            return LanguageGC.Hacked
        case .Japanese:
            return LanguageGC.Japanese
        case .English:
            return LanguageGC.English
        case .German:
            return LanguageGC.German
        case .French:
            return LanguageGC.French
        case .Spanish:
            return LanguageGC.Spanish
        case .Italian:
            return LanguageGC.Italian
        default:
            return LanguageGC.English
        }
    }
}

enum LanguageGC: Int, CaseIterable, Comparable {
    case
    /// Undefined Language ID, usually indicative of a value not being set. Gen5 Japanese In-game Trades happen to not have their Language value set, and express Language=0.
    Hacked = 0,

    /// Japanese (日本語)
    Japanese = 1,

    /// English (US/UK/AU)
    English = 2,

    /// German (Deutsch)
    German = 3,

    /// French (Français)
    French = 4,

    /// Italian (Italiano)
    Italian = 5,

    /// Spanish (Español)
    Spanish = 6,

    /// Unused Language ID. Was reserved for Korean in Gen3 but never utilized.
    UNUSED_6 = 7
    
    static func < (lhs: LanguageGC, rhs: LanguageGC) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    /// Converts `LanguageGC`  to `LanguageID`.
    func toLanguageID() -> LanguageID {
        switch self {
        case .Hacked:
            return LanguageID.Hacked
        case .Japanese:
            return LanguageID.Japanese
        case .English:
            return LanguageID.English
        case .German:
            return LanguageID.German
        case .French:
            return LanguageID.French
        case .Spanish:
            return LanguageID.Spanish
        case .Italian:
            return LanguageID.Italian
        default:
            return LanguageID.English
        }
    }
}
