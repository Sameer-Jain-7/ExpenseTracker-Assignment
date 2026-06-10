//
//  AnalyticsView.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 11/06/26.
//

import SwiftUI

struct AnalyticsView: View {

    @StateObject
    private var viewModel = AnalyticsViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    AnalyticsCard(
                        title: "Total Expenses",
                        value:
                            "₹\(viewModel.totalExpense, default: "%.2f")"
                    )

                    AnalyticsCard(
                        title: "Average Expense",
                        value:
                            "₹\(viewModel.averageExpense, default: "%.2f")"
                    )

                    AnalyticsCard(
                        title: "Transactions",
                        value:
                        "\(viewModel.transactionCount)"
                    )

                    AnalyticsCard(
                        title: "Top Category",
                        value:
                        viewModel.topCategory?.title
                        ?? "-"
                    )

                    VStack(alignment: .leading) {
                        Text("Category Breakdown")
                            .font(.headline)
                        
                        ForEach(
                            viewModel.categoryBreakdown,
                            id: \.0
                        ) { item in
                            CategoryBreakdownRow(
                                category: item.0,
                                amount: item.1
                            )
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Analytics")
        }
    }
}
