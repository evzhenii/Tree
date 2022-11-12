//
//  TreeApp.swift
//  Tree
//
//  Created by boockich mac on 12.11.2022.
//

import SwiftUI

@main
struct TreeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
