//
//  FilterPill.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 11/06/26.
//

import SwiftUI

struct FilterPill: View {

    let icon: String
    let title: String

    var body: some View {

        HStack(spacing: 6) {

            Image(systemName: icon)
                .font(.caption)

            Text(verbatim: title)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(1)

            Image(systemName: "chevron.down")
                .font(.caption2)
        }
        .foregroundColor(AppColors.primary)
        .frame(minWidth: 110)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(AppColors.primary.opacity(0.08))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(
                    AppColors.primary.opacity(0.15),
                    lineWidth: 1
                )
        )
    }
}
