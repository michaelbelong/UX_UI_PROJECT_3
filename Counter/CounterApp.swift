//
//  CounterApp.swift
//  Counter
//
//  Created by Metanorm on 1/23/21.
//

import SwiftUI

@main
struct CounterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
