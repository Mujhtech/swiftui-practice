//
//  ContentView.swift
//  basicExpenseWithSwiftData
//
//  Created by Muhideen Mujeeb Adeoye on 29/09/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // SwiftData model container context
    @Environment(\.modelContext) var context
    
    
    @State private var isShowingItemSheet = false
    @Query(sort: \Expense.date) var expenses: [Expense]
    
    
    
    var body: some View {
        NavigationStack{
            
            List {
                
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                }
                .onDelete{ indexSet in
                    for index in indexSet {
                        context.delete(expenses[index])
                    }
                }
                
            }
            
            
            .navigationTitle("Expenses")
            .sheet(isPresented: $isShowingItemSheet){
                AddExpenseSheet()
            }
            .toolbar{
                if !expenses.isEmpty {
                    Button("Add expense", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No expenses", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start adding expenses to see your list")
                    }, actions: {
                        Button("Add Expense") {
                            isShowingItemSheet = true
                        }
                    })
                }
            }
            
        }
        
        
    }
}

#Preview {
    ContentView()
}
