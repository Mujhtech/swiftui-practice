//
//  AddExpenseSheet.swift
//  basicExpenseWithSwiftData
//
//  Created by Muhideen Mujeeb Adeoye on 29/09/2023.
//

import SwiftUI

struct AddExpenseSheet: View {
    
    // SwiftData model container context
    @Environment(\.modelContext) var context
    
    
    @Environment(\.dismiss) private var dismiss
    
    
    @State private var name: String = ""
    @State private var date: Date = .now
    @State private var value: Double = 0
    
    
    var body: some View {
        
        NavigationStack {
            Form {
                TextField("Expense Name", text: $name)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                TextField("Value", value: $value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") { 
                        let expense = Expense(name: name, amount: value, date: date)
                        
                        // Using context auto save
                        context.insert(expense)
                        
                        // To be sure that context save
                        //try! context.save()
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddExpenseSheet()
}
