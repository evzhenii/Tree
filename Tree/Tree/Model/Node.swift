//
//  Node.swift
//  Tree
//
//  Created by boockich mac on 13.11.2022.
//

import Foundation

final class Node {
    
    var name: String {
        String("\(self.hashValue.bigEndian)".suffix(20))
    }
    
    var children: [Node] = []
    
    weak var parent: Node?
    
    func add(_ child: Node) {
        children.append(child)
        child.parent = self
    }
    
    func remove(_ child: Node) {
        children = children.filter { $0 != child }
    }
}

extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

extension Node: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
