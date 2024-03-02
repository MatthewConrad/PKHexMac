//
//  LCRNG.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/1/24.
//

import Foundation

/// 32-bit Linear Congruential RNG
/// - remark:
///     Frame advancement for forward and reverse.
///     See: https://en.wikipedia.org/wiki/Linear_congruential_generator
///     seed_n+1 = seed_n * Multi + Add
enum LCRNG {
    static let mult: Int = 0x41C64E6D
    static let add: Int = 0x00006073
    static let rMult: Int = 0xEEB9EB65
    static let rAdd: Int = 0x0A3561A1

    static let mult2 = mult * mult // 0xC2A29A69
    static let rMult2 = rMult * rMult // 0xDC6C95D9
    static let add2 = add * (mult + 1) // 0xE97E7B6A
    static let rAdd2 = rAdd * (rMult + 1) // 0x4D3CB126

    static let mult3 = mult2 * mult // 0x807DBCB5
    static let rMult3 = rMult2 * rMult // 0xAC36519D
    static let add3 = (add2 * mult) + add // 0x52713895
    static let rAdd3 = (rAdd2 * rMult) + rAdd // 0x923B279F

    static let mult4 = mult3 * mult // 0xEE067F11
    static let rMult4 = rMult3 * rMult // 0xBECE51F1
    static let add4 = (add3 * mult) + add // 0x31B0DDE4
    static let rAdd4 = (rAdd3 * rMult) + rAdd // 0x7CD1F85C

    static let mult5 = mult4 * mult // 0xEBA1483D
    static let rMult5 = rMult4 * rMult // 0xF1C78F15
    static let add5 = (add4 * mult) + add // 0x8E425287
    static let rAdd5 = (rAdd4 * rMult) + rAdd // 0x0A84D1ED

    static let mult6 = mult5 * mult // 0xD3DC57F9
    static let rMult6 = rMult5 * rMult // 0x8040BA49
    static let add6 = (add5 * mult) + add // 0xE2CCA5EE
    static let rAdd6 = (rAdd5 * rMult) + rAdd // 0x2795C322

    static let mult7 = mult6 * mult // 0x9B355305
    static let rMult7 = rMult6 * rMult // 0x814B81CD
    static let add7 = (add6 * mult) + add // 0xAFC58AC9
    static let rAdd7 = (rAdd6 * rMult) + rAdd // 0xC1FD940B

    static let mult8 = mult7 * mult // 0xCFDDDF21
    static let rMult8 = rMult7 * rMult // 0xB61664E1
    static let add8 = (add7 * mult) + add // 0x67DBB608
    static let rAdd8 = (rAdd7 * rMult) + rAdd // 0x9019E2F8

    static let mult9 = mult8 * mult // 0xFFA0F0DU
    static let rMult9 = rMult8 * rMult // 0x7A0957C5
    static let add9 = (add8 * mult) + add // 0xFC3351DB
    static let rAdd9 = (rAdd8 * rMult) + rAdd // 0x3CFD9579

    /// Multiplication constants for jumping 2^index frames forward
    static let jumpMult: [Int] = [
        0x41C64E6D, 0xC2A29A69, 0xEE067F11, 0xCFDDDF21, 0x5F748241, 0x8B2E1481, 0x76006901, 0x1711D201,
        0xBE67A401, 0xDDDF4801, 0x3FFE9001, 0x90FD2001, 0x65FA4001, 0xDBF48001, 0xF7E90001, 0xEFD20001,
        0xDFA40001, 0xBF480001, 0x7E900001, 0xFD200001, 0xFA400001, 0xF4800001, 0xE9000001, 0xD2000001,
        0xA4000001, 0x48000001, 0x90000001, 0x20000001, 0x40000001, 0x80000001, 0x00000001, 0x00000001,
    ]

    /// Addition constants for jumping 2^index frames  forward
    static let jumpAdd: [Int] = [
        0x00006073, 0xE97E7B6A, 0x31B0DDE4, 0x67DBB608, 0xCBA72510, 0x1D29AE20, 0xBA84EC40, 0x79F01880,
        0x08793100, 0x6B566200, 0x803CC400, 0xA6B98800, 0xE6731000, 0x30E62000, 0xF1CC4000, 0x23988000,
        0x47310000, 0x8E620000, 0x1CC40000, 0x39880000, 0x73100000, 0xE6200000, 0xCC400000, 0x98800000,
        0x31000000, 0x62000000, 0xC4000000, 0x88000000, 0x10000000, 0x20000000, 0x40000000, 0x80000000,
    ]

    /// Used to pre-size a result array for the max number of seeds that may be returned when searching for seeds via PID.
    static let maxCountSeedsPID = 3
    /// Used to pre-size a result array for the max number of seeds that may be returned when searching for seeds via IVs.
    static let maxCountSeedsIV = 6

    static func next(seed: Int) -> Int {
        return (seed * LCRNG.mult) + LCRNG.add
    }

    static func next2(seed: Int) -> Int {
        return (seed * LCRNG.mult2) + LCRNG.add2
    }

    static func next3(seed: Int) -> Int {
        return (seed * LCRNG.mult3) + LCRNG.add3
    }

    static func next4(seed: Int) -> Int {
        return (seed * LCRNG.mult4) + LCRNG.add4
    }

    static func next5(seed: Int) -> Int {
        return (seed * LCRNG.mult5) + LCRNG.add5
    }

    static func next6(seed: Int) -> Int {
        return (seed * LCRNG.mult6) + LCRNG.add6
    }

    static func next7(seed: Int) -> Int {
        return (seed * LCRNG.mult7) + LCRNG.add7
    }

    static func next8(seed: Int) -> Int {
        return (seed * LCRNG.mult8) + LCRNG.add8
    }

    static func next9(seed: Int) -> Int {
        return (seed * LCRNG.mult9) + LCRNG.add9
    }

    static func prev(seed: Int) -> Int {
        return (seed * LCRNG.rMult) + LCRNG.rAdd
    }

    static func prev2(seed: Int) -> Int {
        return (seed * LCRNG.rMult2) + LCRNG.rAdd2
    }

    static func prev3(seed: Int) -> Int {
        return (seed * LCRNG.rMult3) + LCRNG.rAdd3
    }

    static func prev4(seed: Int) -> Int {
        return (seed * LCRNG.rMult4) + LCRNG.rAdd4
    }

    static func prev5(seed: Int) -> Int {
        return (seed * LCRNG.rMult5) + LCRNG.rAdd5
    }

    static func prev6(seed: Int) -> Int {
        return (seed * LCRNG.rMult6) + LCRNG.rAdd6
    }

    static func prev7(seed: Int) -> Int {
        return (seed * LCRNG.rMult7) + LCRNG.rAdd7
    }

    static func prev8(seed: Int) -> Int {
        return (seed * LCRNG.rMult8) + LCRNG.rAdd8
    }

    static func prev9(seed: Int) -> Int {
        return (seed * LCRNG.rMult9) + LCRNG.rAdd9
    }

    /// Gets the next 16 bits of the next RNG seed
    static func next16(seed: Int) -> Int {
        return next(seed: seed) >> 16
    }

    /// Gets the previous 16 bits of the next RNG seed
    static func prev16(seed: Int) -> Int {
        return prev(seed: seed) >> 16
    }

    /// Advances the RNG seed to the next state value a specified amount of times
    static func advance(seed: Int, frames: Int) -> Int {
        var newSeed = seed
        for index in 0 ..< frames {
            newSeed = next(seed: seed)
        }

        return newSeed
    }

    /// Reverses the RNG seed to the next state value a specified amount of times
    static func reverse(seed: Int, frames: Int) -> Int {
        var newSeed = seed
        for index in 0 ..< frames {
            newSeed = prev(seed: seed)
        }

        return newSeed
    }

    /// Computes the number of advances between two seeds,
    static func getDistance(start: Int, end: Int) -> Int {
        var i = 0
        var bit = 1

        var distance = 0
        var seed = start

        /**
         Instead of doing a for loop which always does 32 iterations, check to see if we end up at the end seed.
         If we do, we can return early. Due to the inputs, we normally have low distance, so this shouldn't take more than a few loops.
         */
        while seed != end {
            // 50/50 odds of this being true
            if (seed ^ end) & bit != 0 {
                seed = (seed * LCRNG.jumpMult[i]) + LCRNG.jumpAdd[i]
                distance |= bit
            }

            i += 1
            bit <<= 1
        }

        return distance
    }
}
