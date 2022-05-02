//
//  AddAccountScreen.swift
//  BankApp
//
//  Created by Luann Luna on 27/04/22.
//

import SwiftUI

struct AddAccountScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var vm = AddAccountViewModel()
    
    var body: some View {
        Form {
            TextField("Name", text: $vm.name)
            Picker(selection: $vm.accountType,
                   label: EmptyView()) {
                ForEach(AccountType.allCases, id: \.self) { accountType in
                    Text(accountType.title).tag(accountType)
                }
            }.pickerStyle(SegmentedPickerStyle())
            TextField("Balance", text: $vm.balance)
            
            HStack {
                Spacer()
                Button {
                    vm.createAccount { success in
                        if success {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                } label: {
                    Text("Submit")
                }
                Spacer()
            }
            Text(vm.errorMessage)
        }
        .navigationTitle("Add Account")
        .embedInNavigationView()
    }
}

struct AddAccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddAccountScreen()
    }
}
