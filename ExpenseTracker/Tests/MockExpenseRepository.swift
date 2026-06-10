//
//  MockExpenseRepository.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 11/06/26.
//

@testable import ExpenseTracker

final class MockExpenseRepository: ExpenseRepository {

    var expenses: [Expense] = []

    func fetchExpenses() -> [Expense] {
        expenses
    }

    func save(expense: Expense) {
        expenses.append(expense)
    }

    func update(expense: Expense) {
        if let index = expenses.firstIndex(where: {
            $0.id == expense.id
        }) {
            expenses[index] = expense
        }
    }

    func delete(expense: Expense) {
        expenses.removeAll {
            $0.id == expense.id
        }
    }
}
