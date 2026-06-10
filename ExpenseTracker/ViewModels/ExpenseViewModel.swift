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
    @Published var selectedMonth: Int? = nil
    @Published var selectedYear: Int =
        Calendar.current.component(.year, from: Date())
    // Only Available years shown
    var availableYears: [Int] {
        let years = Set(
            expenses.map {
                Calendar.current.component(
                    .year,
                    from: $0.date
                )
            }
        )
        return years.sorted(by: >)
    }

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

        expenses.filter { expense in

            let categoryMatch =
                selectedCategory == nil ||
                expense.category == selectedCategory

            let monthMatch: Bool

            if let selectedMonth {

                let month = Calendar.current.component(
                    .month,
                    from: expense.date
                )

                monthMatch = month == selectedMonth

            } else {

                monthMatch = true
            }

            let expenseYear = Calendar.current.component(
                .year,
                from: expense.date
            )

            let yearMatch =
                expenseYear == selectedYear

            return categoryMatch &&
                   monthMatch &&
                   yearMatch
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
