//
//  TransferFundsViewModel.swift
//  BankApp
//
//  Created by Luann Luna on 28/04/22.
//

import Foundation

class TransferFundsViewModel: ObservableObject {
    var fromAccount: AccountViewModel?
    var toAccount: AccountViewModel?
    
    
    @Published var message: String?
    @Published var accounts: [AccountViewModel] = [AccountViewModel]()
    
    var filteredAccounts: [AccountViewModel] {
        if fromAccount == nil {
            return accounts
        } else {
            return accounts.filter {
                guard let fromAccount = fromAccount else {
                    return false
                }

                return $0.id != fromAccount.id
            }
        }
    }
    
    var isAmountValid: Bool {
        guard let userAmount = Double(amount) else { return false }
        return !(userAmount <= 0)
    }
    
    var amount: String = ""
    
    var fromAccountType: String {
        fromAccount?.type ?? ""
    }
    
    var toAccountType: String {
        toAccount?.type ?? ""
    }
    
    private func isValid() -> Bool {
        return isAmountValid
    }
    
    func submitTransfer(completion: @escaping ()->Void) {
        
        guard isValid() else { return }
        
        guard let fromAccount = fromAccount,
              let toAccount = toAccount,
              let amount = Double(amount) else {
                  return
        }
        
        let transferFoundsRequest = TransferAccountFundResquest(accountFromId: fromAccount.id.lowercased(), accountToId: toAccount.id.lowercased(), amount: amount)
        
        AccountService.shared.transferFunds(transferFundsRequest: transferFoundsRequest) { result in
            switch result {
            case .success(let response):
                if response.success {
                    completion()
                } else {
                    self.message = response.error
                }
            case .failure(let error):
                self.message = error.localizedDescription
                print(error.localizedDescription)
            }
        }

    }
    
    func populateAccounts() {
        AccountService.shared.getAllAccounts { result in
            switch result {
            case .success(let accounts):
                if let accounts = accounts {
                    DispatchQueue.main.async {
                        self.accounts = accounts.map(AccountViewModel.init)
                    }
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
