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
        NavigationView {
            
            
            VStack(alignment: .leading) {
                Text("This node name is: \(treeViewModel.currentNode.name)")
                Spacer()
                
                VStack {
                    
                    ButtonView(buttonName: "Add new node", action: treeViewModel.addNode)
                    ButtonView(buttonName: "Move to parent node", action: treeViewModel.moveToParent)
                    
                }
                
                Text("This node has \(treeViewModel.currentNode.children.count) children")
                
                List() {
                    ForEach(treeViewModel.currentNode.children) { child in
                        Button(action: {
                            treeViewModel.moveToChild(child)
                        }, label: {
                            VStack(alignment: .leading, spacing: 15) {
                                Text("name: \(child.name)")
                                    .lineLimit(1)
                                    .font(.title3)
                                    .minimumScaleFactor(0.5)
                                
                                Text("\(child.children.count) children")
                            }
                        })
                    }
                    .onDelete(perform: treeViewModel.delete(at:))
                }
            }
            .navigationTitle("Tree")
            .padding()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
