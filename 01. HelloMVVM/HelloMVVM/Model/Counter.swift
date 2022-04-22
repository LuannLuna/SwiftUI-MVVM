//
//  Counter.swift
//  HelloMVVM
//
//  Created by Luann Luna on 22/04/22.
//

import Foundation

struct Counter {
    var value: Int = 0
    var isPremiun: Bool = false
    mutating func increment() {
        value += 1
        isPremiun = value.isMultiple(of: 3)
    }
}
