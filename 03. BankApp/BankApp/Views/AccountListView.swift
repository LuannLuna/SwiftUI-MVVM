//
//  AccountListView.swift
//  BankApp
//
//  Created by Luann Luna on 25/04/22.
//

import SwiftUI

struct AccountListView: View {
    
    let accounts: [AccountViewModel]
    
    var body: some View {
        List(accounts, id: \.id) { account in
            AccountCell(account: account)
        }
    }
}

struct AccountListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let john = AccountViewModel(account: Account(id: UUID(), name: "John Doe", accountType: .checking, balance: 200))
        let jane = AccountViewModel(account: Account(id: UUID(), name: "Jane Doe", accountType: .checking, balance: 500))
        
        AccountListView(accounts: [john, jane])
    }
}

struct AccountCell: View {
    let account: AccountViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(account.name)
                    .font(.headline)
                
                Text(account.type)
                    .opacity(0.8)
            }
            Spacer()
            Text("\(account.balance.formatAsCurrency())")
                .foregroundColor(.green)
        }
    }
}
