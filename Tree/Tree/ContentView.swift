//
//  ContentView.swift
//  Tree
//
//  Created by boockich mac on 13.11.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var treeViewModel: TreeViewModel = TreeViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Current node: \(treeViewModel.currentNode.name)".uppercased())
            Spacer()
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
        ContentView()
    }
}
