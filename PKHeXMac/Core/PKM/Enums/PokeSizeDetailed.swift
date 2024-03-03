//
//  PokeSizeDetailed.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

/// Size groupings for an entity's height and weight
enum PokeSizeDetailed {
    case XXXS,
         XXS,
         XS,
         S,
         AV,
         L,
         XL,
         XXL,
         XXXL
    
    /// Compares the sizing scalar to different thresholds to determine size rating.
    static func getSizeRating(scalar: Int) -> PokeSizeDetailed {
        return if scalar == 0 {
            .XXXS
        } else if scalar < 25 {
            .XXS
        } else if scalar < 60 {
            .XS
        } else if scalar < 100 {
            .S
        } else if scalar <= 155 {
            .AV
        } else if scalar <= 195 {
            .L
        } else if scalar <= 230 {
            .XL
        } else if scalar < 255 {
            .XXL
        } else {
            .XXXL
        }
    }
}
