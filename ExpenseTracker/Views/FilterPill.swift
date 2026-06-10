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

        HStack(spacing: 8) {

            Image(systemName: icon)

            Text(verbatim: title).lineLimit(1)

            Image(systemName: "chevron.down")
                .font(.caption)
        }
        .frame(minWidth: 140)
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(
            AppColors.secondary.opacity(0.1)
        )
        .clipShape(Capsule())
    }
}
