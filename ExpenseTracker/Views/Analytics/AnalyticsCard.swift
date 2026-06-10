//
//  AnalyticsCard.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 11/06/26.
//

import SwiftUI

struct AnalyticsCard: View {

    let title: String
    let value: String
    var body: some View {
        VStack(spacing: 6) {
            Text(value)
                .font(.title2)
                .bold()

            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 16
            )
        )
        .shadow(
            color: .black.opacity(0.05),
            radius: 5
        )
    }
}
