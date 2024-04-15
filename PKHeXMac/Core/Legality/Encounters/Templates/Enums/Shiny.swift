//
//  Shiny.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 4/14/24.
//

import Foundation

/// Specification for PKM.isShiny, used for creating and validating
enum Shiny: Int {
    /// PID is purely random, can be shiny or not shiny
    case random = 0,
         /// PID is forced to be not shiny
         never,
         /// PID is forced to be shiny
         always,
         /// forced to be shiny as Stars
         alwaysStar,
         /// forced to be shiny as Squares
         alwaysSquare,
         /// PID is fixed to be a specified value
         fixedValue

    static var showSquareBeforeGen8: Bool = false

    func isValid(pk: PKMProtocol) -> Bool {
        switch self {
        case .always:
            return pk.isShiny
        case .never:
            return !pk.isShiny
        case .alwaysSquare:
            return pk.shinyXOR == 0
        case .alwaysStar:
            return pk.shinyXOR == 1
        default:
            return true
        }
    }

    func isShiny() -> Bool {
        switch self {
        case .always, .alwaysStar, .alwaysSquare:
            return true
        default:
            return false
        }
    }

    /// Indicates if square shiny exists and should be shown to the user.
    static func isSquareShinyExist(pk: PKMProtocol) -> Bool {
        return if pk.format < 8 && !self.showSquareBeforeGen8 {
            false
        } else {
            pk.shinyXOR == 0 || pk.fatefulEncounter || pk.version == .GG
        }
    }
}
