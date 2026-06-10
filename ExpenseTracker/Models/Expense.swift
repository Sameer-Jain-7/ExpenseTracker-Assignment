//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

import Foundation

struct Expense: Identifiable, Codable {
    
    let id: UUID
    let title: String
    let amount: Double
    let category: ExpenseCategory
    let date: Date
    
    init(
        id: UUID = UUID(),
        title: String,
        amount: Double,
        category: ExpenseCategory,
        date: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.amount = amount
        self.category = category
        self.date = date
    }
}
