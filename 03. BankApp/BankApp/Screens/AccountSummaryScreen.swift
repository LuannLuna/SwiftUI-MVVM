//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by Luann Luna on 25/04/22.
//

import SwiftUI

enum ActiveSheet {
    case addAccount
    case transferFunds
}

struct AccountSummaryScreen: View {
    
    @ObservedObject private var vm = AccountSummaryViewModel()
    @State private var isPresented: Bool = false
    @State private var activeSheet: ActiveSheet = .addAccount
    
    var body: some View {
        VStack {
            
            GeometryReader { g in
                VStack {
                    AccountListView(accounts: vm.accounts)
                        .frame(height: g.size.height / 2)
                    Text("\(vm.total.formatAsCurrency())")
                    Spacer()
                    Button {
                        activeSheet = .transferFunds
                        isPresented = true
                    } label: {
                        Text("Transfer Funds")
                    }.padding()
                }
            }
        }
        .onAppear {
            self.vm.getAllAccounts()
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            self.vm.getAllAccounts()
        },content: {
            switch activeSheet {
            case .addAccount:
                AddAccountScreen()
            case .transferFunds:
                TransferFundsScreen()
            }
        })
        .navigationBarItems(trailing: Button {
            activeSheet = .addAccount
            isPresented = true
        } label: {
            Text("Add Account")
        })
        .navigationBarTitle("Account Summary")
        .embedInNavigationView()
    }
}

struct AccountSummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountSummaryScreen()
    }
}
