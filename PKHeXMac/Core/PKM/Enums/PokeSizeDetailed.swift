//
//  PokeSizeDetailed.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import Foundation

enum PokeSizeDetailed {
    case XXXS
    case XXS
    case XS
    case S
    case AV
    case L
    case XL
    case XXL
    case XXXL
}

class PokeSizeDetailedUtil {
    func getSizeRating(scalar: Int) -> PokeSizeDetailed {
        return if scalar == 0 {
            PokeSizeDetailed.XXXS
        } else if scalar <= 24 {
            PokeSizeDetailed.XXS
        } else if scalar <= 59 {
            PokeSizeDetailed.XS
        } else if scalar < 100 {
            PokeSizeDetailed.S
        } else if scalar <= 155 {
            PokeSizeDetailed.AV
        } else if scalar <= 195 {
            PokeSizeDetailed.L
        } else if scalar <= 230 {
            PokeSizeDetailed.XL
        } else if scalar < 255 {
            PokeSizeDetailed.XXL
        } else {
            PokeSizeDetailed.XXXL
        }
    }
}
