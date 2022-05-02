//
//  TransferFundsAccountSelectionView.swift
//  BankApp
//
//  Created by Luann Luna on 28/04/22.
//

import SwiftUI

struct TransferFundsAccountSelectionView: View {
    
    @Binding var showSheet: Bool
    @Binding var isFromAccount: Bool
    @ObservedObject var vm: TransferFundsViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Button {
                self.isFromAccount = true
                self.showSheet = true
            } label: {
                Text("From \(self.vm.fromAccountType)")
            }
            .padding().frame(maxWidth: .infinity)
            .background(
                Color.green
            )
            
            Button {
                self.isFromAccount = false
                self.showSheet = true
            } label: {
                Text("To \(self.vm.toAccountType)")
            }
            .padding().frame(maxWidth: .infinity)
            .background(
                Color.green
            )
            .opacity(vm.fromAccount != nil ? 1.0 : 0.5)
            .disabled(vm.fromAccount == nil)
            
            TextField("Amount", text: self.$vm.amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }
        .padding()
        .foregroundColor(Color.white)
    }
}

struct TransferFundsAccountSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TransferFundsAccountSelectionView(showSheet: .constant(true), isFromAccount: .constant(true), vm: TransferFundsViewModel())
    }
}
