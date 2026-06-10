//
//  AnalyticsViewModel.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 11/06/26.
//

import Foundation
import Combine

@MainActor
final class AnalyticsViewModel: ObservableObject {

    @Published var expenses: [Expense] = []
    private let repository: ExpenseRepository

    init(
        repository: ExpenseRepository? = nil
    ) {
        self.repository = repository ?? LocalExpenseRepository()
        loadExpenses()
    }

    func loadExpenses() {
        expenses = repository.fetchExpenses()
    }

    var totalExpense: Double {
        expenses.reduce(0) {
            $0 + $1.amount
        }
    }

    var averageExpense: Double {
        guard !expenses.isEmpty else {
            return 0
        }
        return totalExpense /
        Double(expenses.count)
    }

    var transactionCount: Int {
        expenses.count
    }

    var topCategory: ExpenseCategory? {
        Dictionary(
            grouping: expenses,
            by: \.category
        )
        .max {
            $0.value.count < $1.value.count
        }?
        .key
    }

    var categoryBreakdown:
    [(ExpenseCategory, Double)] {
        ExpenseCategory.allCases.map {
            category in
            let total = expenses
                .filter {
                    $0.category == category
                }
                .reduce(0) {
                    $0 + $1.amount
                }
            return (
                category,
                total
            )
        }
        .filter {
            $0.1 > 0
        }
    }
}
