//
//  StatCard.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 11/06/26.
//

import SwiftUI

struct StatCard: View {

    let title: String
    let value: String

    var body: some View {

        VStack(spacing: 2) {

            Text(value)
                .font(.headline)
                .fontWeight(.bold)

            Text(title)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 65)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(.background)
        )
        .shadow(
            color: .black.opacity(0.03),
            radius: 4,
            y: 2
        )
    }
}
