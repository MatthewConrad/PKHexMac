//
//  AppliedMarkings.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/4/24.
//

import Foundation

// TODO: relocate me maybe?
enum MarkingColor: UInt8 {
    case None = 0,
         Blue,
         Pink
}

/// Indicates if the entity can be marked with simple shapes by the player.
protocol AppliedMarkings {
    associatedtype T

    /// Count of unique markings that can be applied to the object.
    var markingCount: Int { get }

    /// Gets the marking value at the given index.
    func getMarking(index: Int) -> T

    /// Sets the marking value at a given index.
    mutating func setMarking(index: Int, value: T)
}

/// Generation 3 Markings
protocol AppliedMarkings3: AppliedMarkings where T == Bool {
    /// Backing value for the packed bits.
    var markingValue: Bool { get set }

    var markingCircle: Bool { get set }
    var markingTriangle: Bool { get set } // In gen 3 this is index 2
    var markingSquare: Bool { get set } // In gen 3 this is index 1
    var markingHeart: Bool { get set }
}

/// Generations 4-6 Markings
protocol AppliedMarkings4: AppliedMarkings3 {
    var markingStar: Bool { get set }
    var markingDiamond: Bool { get set }
}

/// Generation 7+ Markings
protocol AppliedMarkings7: AppliedMarkings where T == MarkingColor {
    var markingValue: UInt16 { get set }

    var markingCircle: MarkingColor { get set }
    var markingTriangle: MarkingColor { get set }
    var markingSquare: MarkingColor { get set }
    var markingHeart: MarkingColor { get set }
    var markingStar: MarkingColor { get set }
    var markingDiamond: MarkingColor { get set }
}
