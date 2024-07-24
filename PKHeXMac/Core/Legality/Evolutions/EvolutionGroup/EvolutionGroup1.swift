////
////  EvolutionGroup1.swift
////  PKHeXMac
////
////  Created by Matthew Conrad on 7/15/24.
////
//
//import Foundation
//
//struct EvolutionGroup1: EvolutionGroup, EvolutionEnvironment {
//    static let instance = EvolutionGroup1()
//    private static let tree: EvolutionTree
//    private static let tweak = EvolutionRuleTweak.Default
//    
//    func getNext(pk: PKMProtocol, origin: EvolutionOrigin) -> EvolutionGroup {
//        EvolutionGroup2.instance
//    }
//    
//    func getPrevious(pk: PKMProtocol, origin: EvolutionOrigin) -> EvolutionGroup? {
//        pk.format == 1 && ParseSettings.allowGen1Tradeback ? EvolutionGroup2.instance : nil
//    }
//    
//    func getPrevious(pk: PKMProtocol, enc: EvolutionOrigin) -> EvolutionGroup? {
//        
//    }
//    
//    func getNext(pk: PKMProtocol, enc: EvolutionOrigin) -> EvolutionGroup? {
//        
//    }
//    
//    func devolve(result: inout [EvoCriteria], pk: PKMProtocol, enc: EvolutionOrigin) -> Int {
//        
//    }
//    
//    func evolve(result: inout [EvoCriteria], pk: PKMProtocol, enc: EvolutionOrigin, history: EvolutionHistory) -> Int {
//        
//    }
//    
//    func discardForOrigin(result: inout [EvoCriteria], pk: PKMProtocol, enc: EvolutionOrigin) {
//        if !ParseSettings.allowGen1Tradeback {
//            return
//        }
//        
//        if enc.generation == 1 {
//            EvolutionUtil.discard
//        }
//    }
//    
//    func tryDevolve<T>(_ head: T, pk: PKMProtocol, currentMaxLevel: UInt8, levelMin: UInt8, skipChecks: Bool) -> (success: Bool, result: EvoCriteria?) where T: SpeciesForm {
//        
//    }
//    
//    func tryEvolve<T>(_ head: T, next: SpeciesForm, pk: PKMProtocol, currentMaxLevel: UInt8, levelMin: UInt8, skipChecks: Bool) -> (success: Bool, result: EvoCriteria?) where T: SpeciesForm {
//        
//    }
//}
