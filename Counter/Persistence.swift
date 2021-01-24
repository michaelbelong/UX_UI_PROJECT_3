//
//  Persistence.swift
//  Counter
//
//  Created by Metanorm on 1/23/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Count")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
        }
        
    }
}
