//
//  ExpenseCell.swift
//  basicExpenseWithSwiftData
//
//  Created by Muhideen Mujeeb Adeoye on 29/09/2023.
//

import SwiftUI

struct ExpenseCell: View {
    
    let expense: Expense
    
    var body: some View {
        HStack {
            Text(expense.date, format: .dateTime.month(.abbreviated))
                .frame(width: 70, alignment: .leading)
            Text(expense.name)
            Spacer()
            Text(expense.amount, format: .currency(code: "USD"))
        }
    }
}

//#Preview {
//    ExpenseCell()
//}
