//
//  ExpenseListView.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

import SwiftUI

struct ExpenseListView: View {

    @StateObject
    private var viewModel = ExpenseViewModel()
    @State
    private var showAddScreen = false

    var body: some View {
        
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {

                HStack(spacing: 12) {

                    CategoryFilterView(
                        category: nil,
                        isSelected: viewModel.selectedCategory == nil
                    ) {

                        viewModel.selectedCategory = nil
                    }

                    ForEach(ExpenseCategory.allCases) { category in

                        CategoryFilterView(
                            category: category,
                            isSelected: viewModel.selectedCategory == category
                        ) {

                            viewModel.selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal)
            }
            ScrollView {

                VStack(spacing: 16) {

                    SummaryCardView(
                        total: viewModel.totalExpense
                    )

                    LazyVStack(spacing: 12) {

                        ForEach(viewModel.filteredExpenses) {
                            ExpenseRowView(expense: $0)
                        }
                    }
                }
                .padding()
            }
            .padding()
            .navigationTitle("Expenses")
            .toolbar {

                ToolbarItem(
                    placement: .topBarTrailing
                ) {
                    Button {
                        showAddScreen = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(
                isPresented: $showAddScreen
            ) {
                NavigationStack {
                    AddExpenseView(
                        viewModel: viewModel
                    )
                }
            }
        }
    }
}
