//
//  LocalExpenseRepository.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

final class LocalExpenseRepository: ExpenseRepository {

    private let manager = UserDefaultsManager()

    func fetchExpenses() -> [Expense] {
        manager.getExpenses()
    }

    func save(expense: Expense) {
        var expenses = manager.getExpenses()
        expenses.append(expense)
        manager.saveExpenses(expenses)
    }

    func delete(expense: Expense) {
        var expenses = manager.getExpenses()
        expenses.removeAll {
            $0.id == expense.id
        }
        manager.saveExpenses(expenses)
    }
}
