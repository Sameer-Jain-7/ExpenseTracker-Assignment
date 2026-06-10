//
//  ExpenseCategory.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

import Foundation

enum ExpenseCategory: String, Codable, CaseIterable, Identifiable {

    case food
    case travel
    case shopping
    case bills
    case entertainment
    case others

    var id: String {
        rawValue
    }

    var title: String {
        rawValue.capitalized
    }
}
