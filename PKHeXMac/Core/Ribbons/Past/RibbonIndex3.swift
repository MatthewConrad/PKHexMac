//
//  RibbonIndex3.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 5/20/24.
//

import Foundation

/// Ribbons from Gen 3 that were not carried forward to future formats.
enum RibbonIndex3: UInt8, Comparable {
    case winning, // Battle: Gen3
         victory,

         // Contest: Gen 3
         cool,
         coolSuper,
         coolHyper,
         coolMaster,
         beauty,
         beautySuper,
         beautyHuper,
         beautyMaster,
         cute,
         cuteSuper,
         cuteHyper,
         cuteMaster,
         smart,
         smartSuper,
         smartHyper,
         smartMaster,
         tough,
         toughSuper,
         toughHyper,
         toughMaster,
         MAX
}
