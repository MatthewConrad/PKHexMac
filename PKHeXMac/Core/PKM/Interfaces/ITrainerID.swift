//
//  ITrainerID.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

enum TrainerIDFormat {
    case None, // don't use me
         // 16-bit Trainer ID
         // Generations 1-2 only. Secret ID didn't exist
         SixteenBitSingle,
         // 16-bit Trainer ID, 16-bit secret ID
         // Generations 3-6, and Generation 1-2 transferred 7+
         SixteenBit,
         // 32-bit Trainer ID, showing the lowest 6 digits
         // Generation 7 origin onward
         SixDigit
}

protocol ITrainerID {
    var TrainerIDDisplayFormat: TrainerIDFormat { get }
    var TrainerIDFormatStringTID: String { get }
    var TrainerIDFormatStringSID: String { get }
}

extension ITrainerID {
    var TrainerIDFormatStringTID: String {
        return if TrainerIDDisplayFormat == TrainerIDFormat.SixDigit {
            "D6"
        } else {
            "D5"
        }
    }

    var TrainerIDFormatStringSID: String {
        return if TrainerIDDisplayFormat == TrainerIDFormat.SixDigit {
            "D4"
        } else {
            "D5"
        }
    }

    // this should be implemented by IGeneration extension, PKM/Format/Version
    func getTrainerIDFormat() -> TrainerIDFormat {
        // finish me pls
        return TrainerIDFormat.SixDigit
    }
}
