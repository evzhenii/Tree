//
//  Node.swift
//  Tree
//
//  Created by boockich mac on 13.11.2022.
//

import Combine
import Foundation

final class Node {
    // MARK: - Properties
    var name: String {
        String("\(self.hashValue.bigEndian)".suffix(20))
    }
    
    var children: [Node] = []
    
    weak var parent: Node?
}

// MARK: - Equatable
extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

// MARK: - Hashable
extension Node: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

// MARK: - Identifiable
extension Node: Identifiable {
}
