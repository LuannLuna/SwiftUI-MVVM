//
//  ContentView.swift
//  HelloMVVM
//
//  Created by Luann Luna on 22/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel: CounterViewModel
    
    init() {
        viewModel = CounterViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            
            Text("PREMIUN")
                .foregroundColor(.green)
                .frame(width: 200, height: 100, alignment: .center)
                .font(.largeTitle)
                .opacity(viewModel.isPremiun ? 1 : 0)
            
            Text("\(viewModel.value)")
                .font(.title)
            
            Button {
                viewModel.increment()
            } label: {
                Text("INCREMENT")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.device)
            .previewDevice("iPhone 8")
    }
}
