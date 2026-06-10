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
        VStack(spacing: 12) {
            Text("Total Expense")
            Text("₹\(total, specifier: "%.2f")")
                .font(.title)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(AppColors.primary)
        .foregroundColor(.white)
        .cornerRadius(16)
    }
}
