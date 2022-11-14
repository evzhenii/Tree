//
//  ContentView.swift
//  Tree
//
//  Created by boockich mac on 13.11.2022.
//

import SwiftUI

struct TreeContentView: View {
    @StateObject var treeViewModel: TreeViewModel = TreeViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Current node:".uppercased())
            
            Text(treeViewModel.currentNode.name)
                .padding(15)
                .background(Color.purple)
                .foregroundColor(Color.white)
                .cornerRadius(12)
            
            List {
                Section {
                    ForEach(treeViewModel.currentNode.children) { child in
                        VStack(alignment: .leading, spacing: 15) {
                            Text("\(child.name)")
                                .lineLimit(2)
                                .font(.title3)
                                .minimumScaleFactor(0.5)
                            
                            Text("\(child.children.count) children")
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            treeViewModel.moveToChild(child)
                        }
                    }
                    .onDelete(perform: treeViewModel.delete)
                } header: {
                    Text("This node has \(treeViewModel.currentNode.children.count) children")
                }
            }
            .listStyle(.plain)
            
            HStack(alignment: .center) {
                ButtonView(buttonName: "Move to parent", action: treeViewModel.moveToParent)
                ButtonView(buttonName: "Add new node", action: treeViewModel.addNode)
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TreeContentView()
    }
}
