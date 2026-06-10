//
//  ExpenseCategory.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 10/06/26.
//

import Foundation
import SwiftUI

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
    
    var icon: String {
        
        switch self {
        case .food:
            return "fork.knife"

        case .travel:
            return "car"

        case .shopping:
            return "bag"

        case .bills:
            return "doc.text"

        case .entertainment:
            return "tv"

        case .others:
            return "square.grid.2x2"
        }
    }
    
    var color: Color {

        switch self {

        case .food:
            return .orange

        case .travel:
            return .blue

        case .shopping:
            return .purple

        case .bills:
            return .red

        case .entertainment:
            return .pink

        case .others:
            return .gray
        }
    }
}
