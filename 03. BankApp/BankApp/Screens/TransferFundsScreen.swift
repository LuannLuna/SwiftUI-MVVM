//
//  TransferFundsScreen.swift
//  BankApp
//
//  Created by Luann Luna on 28/04/22.
//

import SwiftUI

struct TransferFundsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var vm = TransferFundsViewModel()
    @State private var showSheet: Bool = false
    @State private var isFromAccount: Bool = false
    
    var actionSheetButtons: [Alert.Button] {
        var actionButtons = vm.filteredAccounts.map { account in
            Alert.Button.default(Text("\(account.name) (\(account.type))")) {
                if self.isFromAccount {
                    self.vm.fromAccount = account
                } else {
                    self.vm.toAccount = account
                }
            }
        }
        actionButtons.append(.cancel())
        return actionButtons
    }
    
    var body: some View {
        ScrollView {
            VStack {
                AccountListView(accounts: vm.accounts)
                    .frame(height: 200)
                TransferFundsAccountSelectionView(showSheet: $showSheet, isFromAccount: $isFromAccount, vm: vm)
                Spacer()
                
                Text(vm.message ?? "")
                
                Button {
                    vm.submitTransfer {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("Submit Transfer")
                }
                .padding()
            }
            .onAppear {
                self.vm.populateAccounts()
            }
            .actionSheet(isPresented: $showSheet, content: {
                ActionSheet(title: Text("Transfer Funds"), message: Text("Choose an account"), buttons: actionSheetButtons)
            })
            .navigationTitle("Transfer Funds")
        .embedInNavigationView()
        }
    }
}

struct TransferFundsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransferFundsScreen()
    }
}
