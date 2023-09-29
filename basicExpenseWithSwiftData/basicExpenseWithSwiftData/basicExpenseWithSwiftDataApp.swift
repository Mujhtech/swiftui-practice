//
//  basicExpenseWithSwiftDataApp.swift
//  basicExpenseWithSwiftData
//
//  Created by Muhideen Mujeeb Adeoye on 29/09/2023.
//

import SwiftUI
import SwiftData

@main
struct basicExpenseWithSwiftDataApp: App {
    
    let container: ModelContainer = {
        let schema = Schema([Expense.self])
        
        let container = try! ModelContainer(for: schema, configurations: [])
        
        return container
    }()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
