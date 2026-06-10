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

    @State private var title = ""
    @State private var amount = ""
    @State private var category: ExpenseCategory = .food

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

            Button {

                guard let value = Double(amount)
                else { return }

                viewModel.addExpense(
                    title: title,
                    amount: value,
                    category: category
                )

                dismiss()

            } label: {

                Label(
                    "Save Expense",
                    systemImage: "plus.circle.fill"
                )
                .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle("Add Expense")
    }
}
