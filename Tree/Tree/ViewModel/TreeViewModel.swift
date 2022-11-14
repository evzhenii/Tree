//
//  TreeViewModel.swift
//  Tree
//
//  Created by boockich mac on 13.11.2022.
//

import SwiftUI

class TreeViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var nodes: [Node] = []
    @Published var currentNode: Node = Node()
    
    // MARK: - Initializers
    init() {
        makeRootNode()
    }

    // MARK: - Public methods
    func addNode() {
        let child = Node()
        child.parent = currentNode
        currentNode.children.append(child)
        nodes.append(child)
    }
    
    func delete(at offsets: IndexSet) {
        currentNode.children.remove(atOffsets: offsets)

    }
    
    func removeCurrentNode() {
        guard let parent = currentNode.parent else { return }
        parent.children = parent.children.filter { $0 != currentNode }
        nodes = nodes.filter { $0 != currentNode }
        currentNode = parent

    }
    
    func moveToParent() {
        guard let parent = currentNode.parent else {
            print("move to parent failed")
            return
        }
        currentNode = parent
    }
    
    func moveToChild(_ child: Node) {
        currentNode = child
    }
}

// MARK: - Private methods
private extension TreeViewModel {
    func makeRootNode() {
        let root = Node()
        currentNode = root
        nodes.append(root)
    }
}
