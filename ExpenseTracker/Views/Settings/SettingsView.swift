//
//  SettingsView.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 11/06/26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("About") {
                    Label(
                        "Expense Tracker",
                        systemImage: "creditcard"
                    )
                    Text("Version 1.0")
                }
            }
            .navigationTitle("Settings")
        }
    }
}
