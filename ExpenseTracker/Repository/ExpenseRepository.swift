//
//  ExpenseRepository.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

protocol ExpenseRepository {
    
    func fetchExpenses() -> [Expense]
    func save(expense: Expense)
    func delete(expense: Expense)
}
