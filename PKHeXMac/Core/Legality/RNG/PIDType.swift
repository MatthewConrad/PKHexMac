//
//  PIDType.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/1/24.
//

import Foundation

/// PID + IV correlation
enum PIDType: Int, CaseIterable, Comparable {
    case None, // No relationship between PID and IVs

         /* LCRNG */

         /// Method 1 Variants (H1/J/K)
         Method_1,
         /// Method H2
         Method_2,
         /// Method H3
         Method_3,
         /// Method H4
         Method_4,
         /// Method H1 Unown (FR/LG)
         Method_1_Unown,
         /// Method H2 Unown (FR/LG)
         Method_2_Unown,
         /// Method H3 Unown (FR/LG)
         Method_3_Unown,
         /// Method H4 Unown (FR/LG)
         Method_4_Unown,
         /// Method 1 Roamer (Gen 3)
         Method_1_Roamer,
         /// Event Reversed Order PID restricted to 16bit origin seed
         BACD_R,
         /// Event Reversed Order PID without origin seed restrictions
         BACD_U,
         /// Event Reversed Order PID restricted to 16bit origin seed, anti-shiny
         BACD_R_A,
         /// Event Reversed Order PID without origin seed restrictions, anti-shiny
         BACD_U_A,
         /// Event Reversed Order PID restricted to 16bit origin seed, shiny
         BACD_R_S,
         /// Event Reversed Order PID without origin seed restrictions, shiny
         BACD_U_S,
         /// Event Reversed Order PID restricted to 16bit origin seed, anti-shiny (nyx)
         BACD_R_AX,
         /// Event Reversed Order PID without origin seed restrictions, anti-shiny (nyx)
         BACD_U_AX,
         /// Gen 4 Cute Charm PID, which is forced to an 8bit PID value based on gender & gender ratio
         CuteCharm,
         /// Gen 4 Chained Shiny
         ChainShiny,

         /* XDRNG */

         /// GameVersion.CXD PID+IV correlation
         CXD,
         /// GameVersion.CXD PID+IV correlation, rerolled because shiny
         CXDAnti,
         /// GameVersion.CXD PID+IV which is created immediately after TID16 and SID16 RNG calls
         CXD_ColoStarter,
         /// Gen 3 Pokemon Channel Jirachi
         Channel,
         /// GameVersion.CXD Pokespot PID
         PokeSpot,

         /* ARNG */

         /// Gen 4 Mystery Gift anti-shiny
         G4MGAntiShiny,

         /* Formulaic */

         /// Gen 5 Mystery Gift shiny,  based on TID16, SID16, & Gender bytes
         /// - remark: unrelated to IVs
         G5MGShiny,

         /// Gen 4 Pokewalker PID, never Shiny, based on TID16, SID16, & Gender bytes
         /// - remark: unrelated to IVs
         Pokewalker,

         /// Gen 8 Xoroshiro correlation, based on PID & EC values from a 64bit seed
         Xoroshiro,

         /// Gen 8 Overworld Spawn PID, baed on PID & EC values from a 32bit seed
         Overworld8,

         /// Gen 8b Roaming Pokemon PID, based on EC value = 32bit seed
         Roaming8b,

         /// Gen 9 Tera Raid PID, baed on PID & EC values from a 32bit seed
         Terra9

    static func < (lhs: PIDType, rhs: PIDType) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

    /// Checks if the provided PIDType is one of the in-game Method-X types for Gen 3
    func isClassicMethod() -> Bool {
        return (PIDType.Method_1 ... PIDType.Method_4_Unown).contains(self)
    }
}
