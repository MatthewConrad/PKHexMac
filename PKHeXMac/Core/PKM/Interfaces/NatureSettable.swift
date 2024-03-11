//
//  NatureSettable.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/10/24.
//

import Foundation

protocol NatureSettable: NatureReadable {
    var nature: Nature { get set }
}
