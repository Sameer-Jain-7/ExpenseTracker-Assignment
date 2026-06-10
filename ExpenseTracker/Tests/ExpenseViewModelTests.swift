//
//  ExpenseViewModelTests.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 11/06/26.
//

import Testing
@testable import ExpenseTracker
import Foundation

@MainActor
struct ExpenseViewModelTests {

    @Test
    func addExpense() {

        let repository = MockExpenseRepository()

        let viewModel = ExpenseViewModel(
            repository: repository
        )

        viewModel.addExpense(
            title: "Coffee",
            amount: 100,
            category: .food,
            date: Date()
        )

        #expect(
            viewModel.expenses.count == 1
        )
    }

    @Test
    func deleteExpense() {

        let repository = MockExpenseRepository()

        let expense = Expense(
            title: "Movie",
            amount: 500,
            category: .entertainment
        )

        repository.expenses = [expense]

        let viewModel = ExpenseViewModel(
            repository: repository
        )

        viewModel.loadExpenses()

        viewModel.deleteExpense(expense)

        #expect(
            viewModel.expenses.isEmpty
        )
    }

    @Test
    func updateExpense() {

        let repository = MockExpenseRepository()

        let expense = Expense(
            title: "Food",
            amount: 100,
            category: .food
        )

        repository.expenses = [expense]

        let viewModel = ExpenseViewModel(
            repository: repository
        )

        viewModel.loadExpenses()

        viewModel.updateExpense(
            id: expense.id,
            title: "Pizza",
            amount: 300,
            category: .food,
            date: expense.date
        )

        #expect(
            viewModel.expenses.first?.title == "Pizza"
        )

        #expect(
            viewModel.expenses.first?.amount == 300
        )
    }

    @Test
    func totalExpenseCalculation() {

        let repository = MockExpenseRepository()

        repository.expenses = [
            Expense(
                title: "Food",
                amount: 100,
                category: .food
            ),
            Expense(
                title: "Travel",
                amount: 200,
                category: .travel
            )
        ]

        let viewModel = ExpenseViewModel(
            repository: repository
        )

        viewModel.loadExpenses()

        #expect(
            viewModel.totalExpense == 300
        )
    }

    @Test
    func categoryFilter() {

        let repository = MockExpenseRepository()

        repository.expenses = [
            Expense(
                title: "Food",
                amount: 100,
                category: .food
            ),
            Expense(
                title: "Travel",
                amount: 200,
                category: .travel
            )
        ]

        let viewModel = ExpenseViewModel(
            repository: repository
        )

        viewModel.loadExpenses()

        viewModel.selectedCategory = .food

        #expect(
            viewModel.filteredExpenses.count == 1
        )

        #expect(
            viewModel.filteredExpenses.first?.category == .food
        )
    }

    @Test
    func monthFilter() {

        let january = Calendar.current.date(
            from: DateComponents(
                year: 2026,
                month: 1,
                day: 1
            )
        )!

        let february = Calendar.current.date(
            from: DateComponents(
                year: 2026,
                month: 2,
                day: 1
            )
        )!

        let repository = MockExpenseRepository()

        repository.expenses = [
            Expense(
                title: "Jan",
                amount: 100,
                category: .food,
                date: january
            ),
            Expense(
                title: "Feb",
                amount: 200,
                category: .food,
                date: february
            )
        ]

        let viewModel = ExpenseViewModel(
            repository: repository
        )

        viewModel.loadExpenses()

        viewModel.selectedYear = 2026
        viewModel.selectedMonth = 1

        #expect(
            viewModel.filteredExpenses.count == 1
        )

        #expect(
            viewModel.filteredExpenses.first?.title == "Jan"
        )
    }

    @Test
    func yearFilter() {

        let date2025 = Calendar.current.date(
            from: DateComponents(
                year: 2025,
                month: 1,
                day: 1
            )
        )!

        let date2026 = Calendar.current.date(
            from: DateComponents(
                year: 2026,
                month: 1,
                day: 1
            )
        )!

        let repository = MockExpenseRepository()

        repository.expenses = [
            Expense(
                title: "2025",
                amount: 100,
                category: .food,
                date: date2025
            ),
            Expense(
                title: "2026",
                amount: 200,
                category: .food,
                date: date2026
            )
        ]

        let viewModel = ExpenseViewModel(
            repository: repository
        )

        viewModel.loadExpenses()

        viewModel.selectedYear = 2026

        #expect(
            viewModel.filteredExpenses.count == 1
        )

        #expect(
            viewModel.filteredExpenses.first?.title == "2026"
        )
    }
}
