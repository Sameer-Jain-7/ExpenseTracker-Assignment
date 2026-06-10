//
//  ExpenseRowView.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

import SwiftUI

struct ExpenseRowView: View {

    let expense: Expense

    private var formattedDate: String {
        expense.date.formatted(
            date: .abbreviated,
            time: .shortened
        )
    }

    var body: some View {

        HStack(spacing: 16) {

            // Category Icon
            ZStack {

                Circle()
                    .fill(expense.category.color.opacity(0.15))
                    .frame(width: 50, height: 50)

                Image(systemName: expense.category.icon)
                    .font(.title3)
                    .foregroundColor(expense.category.color)
            }

            VStack(alignment: .leading, spacing: 6) {

                Text(expense.title)
                    .font(.headline)
                    .lineLimit(1)

                Text(expense.category.title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                HStack(spacing: 4) {

                    Image(systemName: "calendar")
                        .font(.caption2)

                    Text(formattedDate)
                        .font(.caption2)
                }
                .foregroundColor(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 6) {

                Text("₹\(expense.amount, specifier: "%.2f")")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.red)

                Text("Expense")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 20,
                style: .continuous
            )
        )
        .shadow(
            color: .black.opacity(0.05),
            radius: 8,
            x: 0,
            y: 4
        )
    }
}
