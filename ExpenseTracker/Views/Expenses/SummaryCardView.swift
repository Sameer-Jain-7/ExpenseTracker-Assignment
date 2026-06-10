//
//  SummaryCardView.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

import SwiftUI

struct SummaryCardView: View {

    let total: Double

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 8
        ) {

            Text("Total Expense")
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))

            Text("₹\(total, specifier: "%.0f")")
                .font(.title)
                .fontWeight(.bold)

            Spacer()

            Label(
                "Current Period",
                systemImage: "chart.line.uptrend.xyaxis"
            )
            .font(.caption2)
            .foregroundColor(.white.opacity(0.8))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 110)
        .padding()
        .background(
            LinearGradient(
                colors: [
                    AppColors.primary,
                    AppColors.primary.opacity(0.8)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 20
            )
        )
    }
}
