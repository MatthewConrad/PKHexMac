//
//  Memories.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 3/10/24.
//

import Foundation

/// Generation 6 Memory parameters & validation
enum Memories {
    static let argTypes: [UInt8] = [
        0, 1, 1, 1, 1, 5, 2, 3, 0, 3,
        0, 0, 4, 3, 3, 5, 4, 3, 3, 1,
        0, 3, 0, 0, 1, 3, 5, 0, 0, 3,
        0, 1, 1, 1, 5, 1, 1, 1, 1, 1,
        5, 0, 1, 0, 3, 3, 0, 0, 4, 4,
        3, 5, 1, 0, 0, 0, 0, 0, 0, 1,
        3, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 3, 3, 0, 0, 3, 0, 0, 0, 0,
        4, 4, 3, 3, 5, 0, 1, 3, 5, 4,
    ]

    static func getMemoryArgType(memory: UInt8, memoryGen: Int) -> MemoryArgType {
        if memory >= argTypes.count {
            return .None
        }

        let type = argTypes[Int(memory)]
        return if memoryGen > 6 && type == MemoryArgType.SpecificLocation.rawValue {
            .GeneralLocation
        } else {
            MemoryArgType(rawValue: type) ?? .None
        }
    }

    static func getContext(context: EntityContext) -> MemoryContext {
        let gen = context.generation()

        return if gen <= 7 {
            MemoryContext6.instance
        } else {
            MemoryContext8.instance
        }
    }

    static func getMemoryItemParams(context: EntityContext) -> Set<UInt16> {
        getContext(context: context).getMemoryItemParams()
    }
}
