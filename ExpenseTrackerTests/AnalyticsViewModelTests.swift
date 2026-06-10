//
//  AnalyticsViewModelTests.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 11/06/26.
//

import Testing
@testable import ExpenseTracker

@MainActor
struct AnalyticsViewModelTests {

    @Test
    func averageExpense() {

        let repository = MockExpenseRepository()

        repository.expenses = [
            Expense(
                title: "A",
                amount: 100,
                category: .food
            ),
            Expense(
                title: "B",
                amount: 300,
                category: .food
            )
        ]

        let viewModel = AnalyticsViewModel(
            repository: repository
        )

        #expect(
            viewModel.averageExpense == 200
        )
    }

    @Test
    func transactionCount() {

        let repository = MockExpenseRepository()

        repository.expenses = [
            Expense(
                title: "A",
                amount: 100,
                category: .food
            ),
            Expense(
                title: "B",
                amount: 300,
                category: .food
            )
        ]

        let viewModel = AnalyticsViewModel(
            repository: repository
        )

        #expect(
            viewModel.transactionCount == 2
        )
    }

    @Test
    func topCategory() {

        let repository = MockExpenseRepository()

        repository.expenses = [
            Expense(
                title: "Food1",
                amount: 100,
                category: .food
            ),
            Expense(
                title: "Food2",
                amount: 200,
                category: .food
            ),
            Expense(
                title: "Travel",
                amount: 300,
                category: .travel
            )
        ]

        let viewModel = AnalyticsViewModel(
            repository: repository
        )

        #expect(
            viewModel.topCategory == .food
        )
    }
}
