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
            List {
                Section {
                    EmptyView()
                } header: {
                    SummaryCardView(
                        total: viewModel.totalExpense
                    )
                    .listRowInsets(EdgeInsets())
                }

                ForEach(viewModel.expenses) {
                    ExpenseRowView(expense: $0)
                }
                .onDelete(perform: viewModel.deleteExpense)
            }
            .listStyle(.plain)
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
