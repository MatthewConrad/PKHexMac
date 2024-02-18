//
//  ResourceUtil.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/7/24.
//

import Foundation

struct TextUtil {
    static let stringListCache: Dictionary<String, [String]> = [:]
    
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
            return stringListCache[fileName]
        }
    }
    
    static func GetStringList(fileName: String) -> [String] {
        let cached = getCachedStringList(fileName: fileName)
        
        return cached != nil ? cached! : FastSplit(s: GetStringResource(name:fileName, path: ""))
    }
 
    static func GetFileName(resource: String) -> String {
        return ""
    }
    
    static func GetFullResourceName(fileName: String, langCode: String, type: String) -> String {
        return "\(type)_\(fileName)_\(langCode)"
    }
}
