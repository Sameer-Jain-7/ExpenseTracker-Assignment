//
//  CategoryBreakdownRow.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 11/06/26.
//

import SwiftUI

struct CategoryBreakdownRow: View {

    let category: ExpenseCategory
    let amount: Double

    var body: some View {
        HStack {
            Label(
                category.title,
                systemImage: category.icon
            )
            Spacer()
            Text(
                "₹\(amount, specifier: "%.2f")"
            )
        }
        .padding()
        .background(
            Color(.systemGray6)
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 12
            )
        )
    }
}
