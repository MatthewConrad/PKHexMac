//
//  ContestStatsReadable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

protocol ContestStatsReadable {
    var contestCool: UInt8 { get }
    var contestBeauty: UInt8 { get }
    var contestCute: UInt8 { get }
    var contestSmart: UInt8 { get }
    var contestTough: UInt8 { get }
    var contestSheen: UInt8 { get }
}

extension ContestStatsReadable {
    func getAllContestStats() -> [UInt8] {
        [contestCool, contestBeauty, contestCute, contestSmart, contestTough, contestSheen]
    }

    func hasContestStats() -> Bool {
        getAllContestStats().contains { $0 != 0 }
    }

    func isContestAboveOrEqual(initial: ContestStatsReadable) -> Bool {
        let all = getAllContestStats(),
            initialAll = initial.getAllContestStats()

        for index in 0 ..< all.count {
            if all[index] < initialAll[index] {
                return false
            }
        }

        return true
    }

    func isContestBelow(initial: ContestStatsReadable) -> Bool {
        !isContestAboveOrEqual(initial: initial)
    }

    func isContestEqual(initial: ContestStatsReadable) -> Bool {
        let all = getAllContestStats(),
            initialAll = initial.getAllContestStats()

        for index in 0 ..< all.count {
            if all[index] != initialAll[index] {
                return false
            }
        }

        return true
    }

    func isAnyContestMax() -> Bool {
        let all = getAllContestStats()

        // exclude contestSheen
        for index in 0 ..< all.count - 1 {
            if all[index] == UInt8.max {
                return true
            }
        }

        return false
    }
}
