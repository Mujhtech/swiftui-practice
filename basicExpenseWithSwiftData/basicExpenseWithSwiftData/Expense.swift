//
//  Expense.swift
//  basicExpenseWithSwiftData
//
//  Created by Muhideen Mujeeb Adeoye on 29/09/2023.
//

import Foundation
import SwiftData

@Model
class Expense {
    
    var name: String
    var amount: Double
    var date: Date
    
    
    init(name: String, amount: Double, date: Date) {
        self.name = name
        self.amount = amount
        self.date = date
    }
}
