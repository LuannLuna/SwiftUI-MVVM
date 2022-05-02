//
//  Double+Extensions.swift
//  BankApp
//
//  Created by Luann Luna on 25/04/22.
//

import Foundation

extension Double {
    func formatAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let formattedCurrency = formatter.string(from: self as NSNumber)
        return formattedCurrency ?? ""
    }
}
