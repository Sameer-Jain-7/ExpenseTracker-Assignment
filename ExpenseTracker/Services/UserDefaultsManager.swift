//
//  UserDefaultsManager.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

import Foundation

final class UserDefaultsManager {

    private let key = "expenses"

    func saveExpenses(_ expenses: [Expense]) {
        if let data = try? JSONEncoder().encode(expenses) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func getExpenses() -> [Expense] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let expenses = try? JSONDecoder().decode([Expense].self, from: data)
        else {
            return []
        }
        return expenses
    }
}
