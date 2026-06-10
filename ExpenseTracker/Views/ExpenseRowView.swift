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

            VStack(alignment: .leading, spacing: 4) {

                Text(expense.title)
                    .font(.headline)

                Label(
                    expense.category.title,
                    systemImage: expense.category.icon
                )
                .font(.caption)
                .foregroundColor(.secondary)
            }

            Spacer()

            Text("₹\(expense.amount, specifier: "%.2f")")
                .fontWeight(.semibold)
                .foregroundColor(.red)
        }
        .padding(.vertical, 8)
    }
}
