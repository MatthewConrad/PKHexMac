//
//  HyperTrainable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/10/24.
//

import Foundation

protocol HyperTrainable {
    var hyperTrainFlags: UInt8 { get set }
    var htHP: Bool { get set }
    var htATK: Bool { get set }
    var htDEF: Bool { get set }
    var htSPE: Bool { get set }
    var htSPA: Bool { get set }
    var htSPD: Bool { get set }
}

extension HyperTrainable {
    /// Toggles the Hyper Training Flag for a given stat
    mutating func hyperTrainInvert(index: Int) -> Bool {
        switch index {
        case 0:
            self.htHP.toggle()
            return self.htHP
        case 1:
            self.htATK.toggle()
            return self.htATK
        case 2:
            self.htDEF.toggle()
            return self.htDEF
        case 3:
            self.htSPE.toggle()
            return self.htSPE
        case 4:
            self.htSPA.toggle()
            return self.htSPA
        case 5:
            self.htSPD.toggle()
            return self.htSPD
        default:
            return false
        }
    }

    func isHyperTrainedAll() -> Bool {
        self.hyperTrainFlags == 0x3F
    }

    func isHyperTrainClear() -> Bool {
        self.hyperTrainFlags == 0
    }

    func isHyperTrained() -> Bool {
        self.hyperTrainFlags != 0
    }

    /// Gets a stat HT flag based on its index.
    func isHyperTrained(index: Int) -> Bool {
        switch index {
        case 0:
            return self.htHP
        case 1:
            return self.htATK
        case 2:
            return self.htDEF
        case 3:
            return self.htSPE
        case 4:
            return self.htSPA
        case 5:
            return self.htSPD
        default:
            return false
        }
    }

    /// Determines whether speed should be suggested for hyper training.
    /// - remark: Sometimes unusual speed IVs are desirable for competitive reasons.
    func isSpeedHyperTrainSuggested(ivs: [Int]) -> Bool {
        let speed = ivs[3]
        return if speed == 31 || speed <= 2 {
            false
        } else if speed > 17 {
            true
        } else {
            // if IV isn't too high and nothing else has been HT'd, it was probably intentional
            self.htHP || self.htATK || self.htDEF || self.htSPA || self.htSPD
        }
    }

    static func getHyperTrainMinLevel(context: EntityContext) -> Int {
        return if [.Gen7, .Gen7, .Gen8b].contains(context) {
            100
        } else if context == .Gen9 {
            50
        } else {
            101
        }
    }

    static func isHyperTrainingAvailable(context: EntityContext, currentLevel: UInt8) -> Bool {
        currentLevel >= self.getHyperTrainMinLevel(context: context)
    }

    mutating func setSuggestedHyperTrainingData(pk: PKM, ivs: [Int]) {
        self.htHP = ivs[0] != 31
        self.htATK = ivs[1] != 31 && ivs[1] > 2
        self.htDEF = ivs[2] != 31
        self.htSPA = ivs[3] != 31
        self.htSPD = ivs[4] != 31

        self.htSPE = self.isSpeedHyperTrainSuggested(ivs: ivs)

        if let pb = pk as? CombatPower {
            pb.resetCP()
        }
    }

    /*
     TODO:
        - implement PKM.setSuggestedHyperTrainingData (evolutionHistory, IVs)
        - implement PKM.setSuggestedHyperTrainingData (context, IVs)
        - implement PKM.setSuggestedHyperTrainingData (IVs)
        - implement PKM.setSuggestedHyperTrainingData ()
            - and actually, maybe combine... most of these
        - implement HyperTrainable.isHyperTrainingAvailable (evolutionHistory)
        - implement PKM.isHyperTrainingAvailable (evolutionHistory)

     */
}
