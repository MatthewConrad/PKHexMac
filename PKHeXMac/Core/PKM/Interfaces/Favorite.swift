//
//  Favorite.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

/// Exposes Favorite designation in `GameVersion.GG`
protocol Favoritable {
    var isFavorite: Bool { get set }
}
