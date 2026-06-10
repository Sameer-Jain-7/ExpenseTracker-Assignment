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

    func loadExpenses() {
        expenses = repository.fetchExpenses()
    }

    func addExpense(
        title: String,
        amount: Double,
        category: ExpenseCategory
    ) {
        let expense = Expense(
            title: title,
            amount: amount,
            category: category
        )
        repository.save(expense: expense)
        loadExpenses()
    }

    func deleteExpense(at offsets: IndexSet) {
        offsets.forEach {
            repository.delete(
                expense: expenses[$0]
            )
        }

        loadExpenses()
    }
}
