//
//  ExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class ExpenseViewModel: ObservableObject {

    @Published var expenses: [Expense] = []
    @Published var selectedCategory: ExpenseCategory? = nil
    private let repository: ExpenseRepository

    init(
        repository: ExpenseRepository = LocalExpenseRepository()
    ) {
        self.repository = repository
        loadExpenses()
    }

    var totalExpense: Double {
        expenses.reduce(0) {
            $0 + $1.amount
        }
    }
    
    var filteredTotalExpense: Double {
        filteredExpenses.reduce(0) {
            $0 + $1.amount
        }
    }
    
    var filteredExpenses: [Expense] {
        guard let selectedCategory else {
            return expenses
        }
        return expenses.filter {
            $0.category == selectedCategory
        }
    }

    func loadExpenses() {
        expenses = repository.fetchExpenses()
            .sorted {
                $0.date > $1.date
            }
    }

    func addExpense(
        title: String,
        amount: Double,
        category: ExpenseCategory,
        date: Date
    ) {
        let expense = Expense(
            title: title,
            amount: amount,
            category: category,
            date: date
        )
        repository.save(expense: expense)
        loadExpenses()
    }
    
    func updateExpense(
        id: UUID,
        title: String,
        amount: Double,
        category: ExpenseCategory,
        date: Date
    ) {
        let expense = Expense(
            id: id,
            title: title,
            amount: amount,
            category: category,
            date: date
        )
        repository.update(expense: expense)
        loadExpenses()
    }

    func deleteExpense(at offsets: IndexSet) {

        let itemsToDelete = offsets.map {
            filteredExpenses[$0]
        }
        itemsToDelete.forEach {
            repository.delete(expense: $0)
        }
        loadExpenses()
    }
    
    func deleteExpense(_ expense: Expense) {
        repository.delete(expense: expense)
        loadExpenses()
    }
}
