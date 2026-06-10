//
//  ExpenseCategory.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

import Foundation

enum ExpenseCategory: String, Codable, CaseIterable {

    case food
    case travel
    case shopping
    case bills
    case entertainment
    case others

    var title: String {
        rawValue.capitalized
    }
}
