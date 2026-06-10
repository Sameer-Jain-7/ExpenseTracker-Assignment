//
//  ExpenseRowView.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

import SwiftUI

struct ExpenseRowView: View {

    let expense: Expense
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expense.title)
                    .font(.headline)
                Text(expense.category.title)
                    .font(.caption)
            }
            Spacer()
            Text("₹\(expense.amount, specifier: "%.2f")")
                .foregroundColor(.red)
                .bold()
        }
        .padding(.vertical, 8)
    }
}
