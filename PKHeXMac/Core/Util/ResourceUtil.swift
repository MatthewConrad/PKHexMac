//
//  ResourceUtil.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/7/24.
//

import Foundation

enum TextUtil {
    static let stringListCache: [String: [String]] = [:]

    static func FastSplit(s: String?) -> [String] {
        if s?.count == 0 {
            return []
        }

        return s?.components(separatedBy: .newlines) ?? []
    }

    static func GetStringResource(name: String, path: String) -> String? {
        if let resourceUrl = Bundle.main.url(forResource: name, withExtension: "txt", subdirectory: path) {
            return try? String(contentsOf: resourceUrl, encoding: .utf8)
        }

        return nil
    }

    static func getCachedStringList(fileName: String) -> [String]? {
        return lock(obj: stringListCache) {
            stringListCache[fileName]
        }
    }

    static func GetStringList(fileName: String) -> [String] {
        let cached = getCachedStringList(fileName: fileName)

        return cached != nil ? cached! : FastSplit(s: GetStringResource(name: fileName, path: ""))
    }

    static func GetFileName(resource: String) -> String {
        return ""
    }

    static func GetFullResourceName(fileName: String, langCode: String, type: String) -> String {
        return "\(type)_\(fileName)_\(langCode)"
    }

    static func getFileTest() -> Data? {
        guard let path2 = Bundle.main.url(forResource: "personal_b2w2", withExtension: "", subdirectory: "byte/personal") else {
            fatalError("Could not read file")
        }

        let data = try? Data(contentsOf: path2)

        return data
    }
    
    static func getTextFileTest() -> String? {
        guard let path = Bundle.main.url(forResource: "badwords", withExtension: "txt", subdirectory: "text") else {
            fatalError("could not read file")
        }
        
        let data = try? String(contentsOf: path)
        
        return data
    }
}
