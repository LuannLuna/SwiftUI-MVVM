//
//  CounterViewModel.swift
//  HelloMVVM
//
//  Created by Luann Luna on 22/04/22.
//

import SwiftUI

class CounterViewModel: ObservableObject {
    
    @Published private var counter: Counter = Counter()
    
    var value: Int {
        counter.value
    }
    
    var isPremiun: Bool {
        counter.isPremiun
    }
    
    func increment() {
        counter.increment()
    }
}
