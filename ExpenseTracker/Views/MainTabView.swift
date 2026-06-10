//
//  MainTabView.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 11/06/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExpenseListView()
                .tabItem {
                    Label(
                        "Expenses",
                        systemImage: "list.bullet.rectangle"
                    )
                }

            AnalyticsView()
                .tabItem {
                    Label(
                        "Analytics",
                        systemImage: "chart.bar.fill"
                    )
                }

            SettingsView()
                .tabItem {
                    Label(
                        "Settings",
                        systemImage: "gearshape.fill"
                    )
                }
        }
        .tint(AppColors.primary)
    }
}
