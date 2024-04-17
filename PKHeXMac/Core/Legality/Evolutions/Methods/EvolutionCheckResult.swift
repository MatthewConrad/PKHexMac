//
//  EvolutionCheckResult.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/16/24.
//

import Foundation

enum EvolutionCheckResult: UInt8 {
    case valid = 0,
         insufficientLEvel,
         badGender,
         badForm,
         wrongEC,
         visitVersion,
         lowContestStat,
         untraded
}
