//
//  TransferAccountFund.swift
//  BankApp
//
//  Created by Luann Luna on 27/04/22.
//

import Foundation

struct TransferAccountFundResquest: Codable {
    let accountFromId: String
    let accountToId: String
    let amount: Double
}
