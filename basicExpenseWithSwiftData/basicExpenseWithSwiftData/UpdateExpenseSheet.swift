//
//  UpdateExpenseSheet.swift
//  basicExpenseWithSwiftData
//
//  Created by Muhideen Mujeeb Adeoye on 29/09/2023.
//

import SwiftUI

struct UpdateExpenseSheet: View {
    
    // SwiftData model container context
    @Environment(\.modelContext) var context
    
    
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var expense: Expense
    
    
    var body: some View {
        
        NavigationStack {
            Form {
                TextField("Expense Name", text: $expense.name)
                DatePicker("Date", selection: $expense.date, displayedComponents: .date)
                TextField("Value", value: $expense.amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Update Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
              
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
//                        let expense = Expense(name: name, amount: value, date: date)
                        
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

//#Preview {
//    UpdateExpenseSheet()
//}

