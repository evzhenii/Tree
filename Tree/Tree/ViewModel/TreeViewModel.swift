//
//  TreeViewModel.swift
//  Tree
//
//  Created by boockich mac on 13.11.2022.
//

import SwiftUI

class TreeViewModel: ObservableObject {
    @Published var nodes: [Node] = []
    @Published var currentNode: Node = Node()
    
    init() {
        makeRootNode()
    }
    
    func makeRootNode() {
        let root = Node()
        currentNode = root
        nodes.append(root)
    }
    
    func addNode() {
        let child = Node()
        child.parent = currentNode
        currentNode.children.append(child)
        nodes.append(child)
//        print(currentNode.children.count)
//        currentNode = child

    }
    
//    func removeCustomNode(node: Node) {
//        guard let parent = node.parent else { return }
//        nodes = nodes.filter { $0 != node }
//        parent.children = parent.children.filter { $0 != currentNode }
//
//    }
    
    func delete(at offsets: IndexSet) {
        currentNode.children.remove(atOffsets: offsets)
//        guard let parent = node.parent else { return }
//        nodes = nodes.filter { $0 != node }
//        parent.children = parent.children.filter { $0 != currentNode }

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
//        currentNode.children.objects
//        currentNode = currentNode.children[offsets]
    }
}
