//
//  Locations9.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/18/24.
//

import Foundation

/// Locations for `GameVersion.SV`
struct Locations9
{
    /// Available location list for the 00000 set of location names.
    static let Met0: [Int] = [
        -1,   002, 004, 006, 008,
         010, 012, 014, 016, 018,
         020, 022, 024, 026, 028,
         030, 032, 034, 036, 038,
         040, 042, 044, 046, 048,
         050, 052, 054, 056, 058,
         060, 062, 064, 066, 068,
         070, 072, 074, 076, 078,
         080, 082, 084, 086, 088,
         090, 092, 094, 096, 098,
         102, 104, 106, 108, 110,
         110, 112, 114, 116, 118,
         120, 122, 124, 126, 128,
         
         067, 069,
         099, 101, 103, 105, 107, 109,
         111, 113, 115, 117,
         130, 131, 132, 134, 136, 138,
         140, 142, 144, 146, 148, 150,
         152, 154, 156, 158, 160, 162,
         164, 166, 168, 170, 172, 174,
         176, 178, 180, 182, 184, 186,
         188, 190, 192, 194, 196, 198,
         200
    ];
    
    /// Available location list for the 30000 set of location names.
    static let Met3: [Int] =
    [
        -1,     30001, -1,    30003, 30004, 30005, 30006, 30007, 30008, 30009,
         30010, 30011, 30012, 30013, 30014, 30015, 30016, 30017, 30018, 30019,
         30020, 30021, 30022, 30023, 30024,
    ];
    
    /// Available location list for the 40000 set of location names.
    static let Met4: [Int] =
    [
               40001, 40002, 40003, 40004, 40005, 40006, 40007, 40008, 40009,
        40010, 40011, 40012, 40013, 40014, 40015, 40016, 40017, 40018, 40019,
        40020, 40021, 40022, 40023, 40024, 40025, 40026, 40027, 40028, 40029,
        40030, 40031, 40032, 40033, 40034, 40035, 40036, 40037, 40038, 40039,
        40040, 40041, 40042, 40043, 40044, 40045, 40046, 40047, 40048, 40049,
        40050, 40051, 40052, 40053, 40054, 40055, 40056, 40057, 40058, 40059,
        40060, 40061, 40062, 40063, 40064, 40065, 40066, 40067, 40068, 40069,
        40070, 40071, 40072, 40073, 40074, 40075, 40076, 40077, 40078, 40079,
        40080, 40081, 40082, 40083, 40084, 40085, 40086,
    ];
    
    /// Available location list for the 60000 set of location names.
    static let Met6: [Int] =  [
        /* X/Y */
        60001, 60003,
        /* OR/AS */
        60004
    ];
    
    /// Checks if the location is accessible in Paldea without DLC
    static func isAccessiblePreDLC(location: Int) -> Bool {
        return location <= 131
    }
    
    /// Checks if the location is accessible in Kitakami
    static func isKitakami(location: Int) -> Bool {
        return  location >= 132 && location <= 170
    }
    
    /// Checks if the location is accessible in Blueberry Academy
    static func isBlueberry(location: Int) -> Bool {
        return location >= 172 && location <= 194
    }
    
    /// Checks if the location is Area Zero Underdepths
    static func isPaldeaDLC(location: Int) -> Bool {
        return location == 196 || location == 198
    }
}
