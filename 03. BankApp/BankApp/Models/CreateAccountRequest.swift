//
//  CreateAccountRequest.swift
//  BankApp
//
//  Created by Luann Luna on 27/04/22.
//

import Foundation

struct CreateAccountRequest: Codable {
    let name: String
    let accountType: String
    let balance: Double
}
