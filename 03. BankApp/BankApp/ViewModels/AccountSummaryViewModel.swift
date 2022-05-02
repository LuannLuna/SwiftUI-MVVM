//
//  AccountSummaryViewModel.swift
//  BankApp
//
//  Created by Luann Luna on 25/04/22.
//

import Foundation

class AccountSummaryViewModel: ObservableObject {
    
    private var _accountsModels: [Account] = []
    @Published var accounts: [AccountViewModel] = []
    
    var total: Double {
        _accountsModels.map { $0.balance }.reduce(0, +)
    }
    
    func getAllAccounts() {
        AccountService.shared.getAllAccounts { result in
            switch result {
            case .success(let accounts):
                if let accounts = accounts {
                    DispatchQueue.main.async {
                        self._accountsModels = accounts
                        self.accounts = accounts.map(AccountViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

class AccountViewModel {
    private var account: Account
    
    init(account: Account) {
        self.account = account
    }
    
    var name: String { account.name }
    var id: String { account.id.uuidString }
    var type: String { account.accountType.title }
    var balance: Double { account.balance }
}
