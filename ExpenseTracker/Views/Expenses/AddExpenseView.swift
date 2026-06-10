//
//  AddExpenseView.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

import SwiftUI

struct AddExpenseView: View {

    @Environment(\.dismiss)
    private var dismiss
    @ObservedObject
    var viewModel: ExpenseViewModel
    let expenseToEdit: Expense?

    @State private var title = ""
    @State private var amount = ""
    @State private var category: ExpenseCategory = .food
    @State private var expenseDate = Date()
    
    init(
        viewModel: ExpenseViewModel,
        expenseToEdit: Expense? = nil
    ) {
        self.viewModel = viewModel
        self.expenseToEdit = expenseToEdit
    }
    
    private var hasChanges: Bool {

        guard let expense = expenseToEdit else {

            return !title.isEmpty &&
                   Double(amount) != nil
        }

        return title != expense.title || abs((Double(amount) ?? 0) - expense.amount) > 0.001 || category != expense.category || expenseDate != expense.date
    }

    var body: some View {
        Form {
            Section("Expense Details") {
                TextField(
                    "Enter Expense Title",
                    text: $title
                )

                TextField(
                    "Enter Amount",
                    text: $amount
                )
                .keyboardType(.decimalPad)
            }

            Section("Category") {
                Picker(
                    "Category",
                    selection: $category
                ) {

                    ForEach(
                        ExpenseCategory.allCases,
                        id: \.self
                    ) { category in

                        Label(
                            category.title,
                            systemImage: category.icon
                        )
                        .tag(category)
                    }
                }
            }
            Section("Date & Time") {

                DatePicker(
                    "Expense Date",
                    selection: $expenseDate,
                    displayedComponents: [.date]
                )

                DatePicker(
                    "Expense Time",
                    selection: $expenseDate,
                    displayedComponents: [.hourAndMinute]
                )
            }

            Button {
                guard let value = Double(amount)
                else { return }

                if let expense = expenseToEdit {
                    viewModel.updateExpense(
                        id: expense.id,
                        title: title,
                        amount: value,
                        category: category,
                        date: expenseDate
                    )
                } else {
                    viewModel.addExpense(
                        title: title,
                        amount: value,
                        category: category,
                        date: expenseDate
                    )
                }
                dismiss()
            } label: {

                Label(
                    expenseToEdit == nil
                    ? "Save Expense"
                    : "Update Expense",
                    systemImage:
                        expenseToEdit == nil
                        ? "plus.circle.fill"
                        : "square.and.pencil"
                )
                .frame(maxWidth: .infinity)
            }
            .disabled(!hasChanges)
            .tint(
                hasChanges
                ? AppColors.primary
                : .gray
            )
        }
        .navigationTitle(
            expenseToEdit == nil
            ? "Add Expense"
            : "Edit Expense"
        )
        .onAppear {

            guard let expense = expenseToEdit else {
                return
            }

            title = expense.title
            amount = String(expense.amount)
            category = expense.category
            expenseDate = expense.date
        }
    }
}
