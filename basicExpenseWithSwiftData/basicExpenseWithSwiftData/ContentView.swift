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
    @Query(filter: #Predicate<Expense> { $0.amount > 1000 }, sort: \Expense.date) var expenses: [Expense]
    
    @State private var expenseToEdit: Expense?
    
    
    
    var body: some View {
        NavigationStack{
            
            List {
                
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                        .onTapGesture {
                            expenseToEdit = expense
                        }
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
            .sheet(item: $expenseToEdit) { expense in
                
                UpdateExpenseSheet(expense: expense)
        
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
