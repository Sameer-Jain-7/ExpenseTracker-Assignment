//
//  ExpenseListView.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

import SwiftUI

struct ExpenseListView: View {

    @StateObject private var viewModel = ExpenseViewModel()
    @State private var selectedExpense: Expense?
    @State private var showAddScreen = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {

                ScrollView(.horizontal, showsIndicators: false) {

                    HStack(spacing: 12) {
                        Menu {
                            Button("All Months") {
                                viewModel.selectedMonth = nil
                            }
                            Divider()
                            ForEach(ExpenseMonth.allCases) { month in
                                Button(month.title) {
                                    viewModel.selectedMonth = month.rawValue
                                }
                            }
                        } label: {

                            FilterPill(
                                icon: "calendar",
                                title:
                                    viewModel.selectedMonth == nil
                                    ? "All Months"
                                    : Calendar.current.monthSymbols[
                                        viewModel.selectedMonth! - 1
                                    ]
                            )
                        }

                        // Year Menu
                        Menu {
                            ForEach(
                                viewModel.availableYears,
                                id: \.self
                            ) { year in

                                Button(String(year)) {
                                    viewModel.selectedYear = year
                                }
                            }

                        } label: {
                            FilterPill(
                                icon: "calendar.badge.clock",
                                title: String(viewModel.selectedYear)
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                
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
                
                SummaryCardView(
                    total: viewModel.filteredTotalExpense
                )
                .padding(.horizontal)
                
                HStack {
                    Text(
                        viewModel.selectedMonth == nil
                        ? "All Months"
                        : Calendar.current.monthSymbols[
                            viewModel.selectedMonth! - 1
                        ]
                    )

                    Text(String(viewModel.selectedYear))

                    Text("•")

                    Text(
                        viewModel.selectedCategory?.title
                        ?? "All Categories"
                    )
                }
                .font(.caption)
                .foregroundColor(.secondary)
                
                List {
                    ForEach(viewModel.filteredExpenses) { expense in
                        ExpenseRowView(
                            expense: expense
                        )
                        .swipeActions {
                            Button {
                                selectedExpense = expense
                            } label: {
                                Label(
                                    "Edit",
                                    systemImage: "pencil"
                                )
                            }
                            .tint(.blue)
                            Button(role: .destructive) {
                                viewModel.deleteExpense(expense)
                            } label: {
                                Label(
                                    "Delete",
                                    systemImage: "trash"
                                )
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Expense Manager")
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
            .sheet(isPresented: $showAddScreen) {
                NavigationStack {
                    AddExpenseView(
                        viewModel: viewModel
                    )
                }
            }
            .sheet(item: $selectedExpense) { expense in
                NavigationStack {
                    AddExpenseView(
                        viewModel: viewModel,
                        expenseToEdit: expense
                    )
                }
            }
        }
    }
}
