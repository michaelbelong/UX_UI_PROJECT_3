//
//  ContentView.swift
//  Counter
//
//  Created by Metanorm on 1/23/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var ViewContext
    
    @FetchRequest(sortDescriptors: [])
    var counters: FetchedResults<Count>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(counters) { count in
                    CountRow(count: count)
                }
            }
            .navigationTitle("Counter List 1")
            .navigationBarItems(trailing: Button("Add") {
                addCount()
            })
        }
    }
    
    private func saveContext() {
        do {
            try ViewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
        }
    }
    
    private func addCount() {
        withAnimation {
            let newCount = Count(context: ViewContext)
            newCount.name = "Counter \(Date())"
            newCount.color = "red"
            newCount.timestamp = Date()
            newCount.value = 0
            newCount.group = "Current"
            
            saveContext()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
