//
//  CategoryFilterView.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

import SwiftUI

struct CategoryFilterView: View {

    let category: ExpenseCategory?
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {

            Label(
                category?.title ?? "All",
                systemImage: category?.icon ?? "line.3.horizontal.decrease.circle"
            )
            .font(.subheadline)
            .fontWeight(.medium)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                isSelected
                ? AppColors.primary
                : Color(.systemGray6)
            )
            .foregroundColor(
                isSelected
                ? .white
                : .primary
            )
            .clipShape(Capsule())
        }
    }
}
