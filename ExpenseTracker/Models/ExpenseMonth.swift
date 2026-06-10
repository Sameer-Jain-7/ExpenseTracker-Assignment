//
//  ExpenseMonth.swift
//  ExpenseTracker
//
//  Created by Sameer Jain on 11/06/26.
//

import Foundation

enum ExpenseMonth: Int, CaseIterable, Identifiable {

    case january = 1
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december

    var id: Int {
        rawValue
    }

    var title: String {

        Calendar.current.monthSymbols[
            rawValue - 1
        ]
    }
}
