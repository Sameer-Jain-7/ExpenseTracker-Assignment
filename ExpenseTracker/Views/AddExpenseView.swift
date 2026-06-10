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
            TextField(
                "Title",
                text: $title
            )
            
            TextField(
                "Amount",
                text: $amount
            )
            .keyboardType(.decimalPad)

            Picker(
                "Category",
                selection: $category
            ) {
                ForEach(
                    ExpenseCategory.allCases,
                    id: \.self
                ) {
                    Text($0.title)
                }
            }

            Button("Save") {
                guard let value = Double(amount)
                else {
                    return
                }
                viewModel.addExpense(
                    title: title,
                    amount: value,
                    category: category
                )
                dismiss()
            }
        }
        .navigationTitle("Add Expense")
    }
}
