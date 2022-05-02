//
//  AddAccountViewModel.swift
//  BankApp
//
//  Created by Luann Luna on 27/04/22.
//

import Foundation

class AddAccountViewModel: ObservableObject {
    var name: String = ""
    var accountType: AccountType = .checking
    var balance: String = ""
    
    @Published var errorMessage: String = ""
    
    
}

extension AddAccountViewModel {
    private var isNameValid: Bool {
        !name.isEmpty
    }
    
    private var isBalanceValid: Bool {
        guard let userBalance = Double(balance) else {
            return false
        }
        return !(userBalance <= 0)
    }
    
    private func isValid() -> Bool {
        var errors = [String]()
        
        if !isNameValid {
            errors.append("Name is not valid")
        }
        
        if !isBalanceValid {
            errors.append("Balance is not valid")
        }
        
        if !errors.isEmpty {
            DispatchQueue.main.async {
                self.errorMessage = errors.joined(separator: "\n")
            }
            return false
        }
        
        return true
    }
}

extension AddAccountViewModel {
    func createAccount(completion: @escaping (Bool) -> Void) {
        
        guard isValid() else { return completion(false) }
        
        let createAccountRequest = CreateAccountRequest(name: name, accountType: accountType.rawValue, balance: Double(balance)!)
        AccountService.shared.createAccount(createAccountRequest: createAccountRequest) { result in
            switch result {
            case .success(let response):
                if response.success {
                    completion(true)
                } else {
                    if let error = response.error {
                        DispatchQueue.main.async {
                            self.errorMessage = error
                        }
                        completion(false)
                    }
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
