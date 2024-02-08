//
//  ResourceUtil.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/7/24.
//

import Foundation

struct Util {
    static let stringListCache: Dictionary<String, [String]> = [:]
    
    static func FastSplit(s: String) -> [String] {
        if(s.count == 0) {
            return []
        }
        
        let lines = s.components(separatedBy: .newlines)
    }
    
    static func GetFileName(resource: String) -> String {
        
    }
    
    static func GetFullResourceName(fileName: String, langCode: String, type: String) -> String {
        return "\(type)_\(fileName)_\(langCode)"
    }
}
