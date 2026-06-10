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
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
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
            .shadow(
                color: isSelected
                ? AppColors.primary.opacity(0.2)
                : .clear,
                radius: 8
            )
            .scaleEffect(isSelected ? 1.03 : 1)
            .animation(.easeInOut(duration: 0.2), value: isSelected)
        }
    }
}
