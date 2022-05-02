//
//  View+Extensions.swift
//  BankApp
//
//  Created by Luann Luna on 25/04/22.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
