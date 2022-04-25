//
//  ViewModelBase.swift
//  Movies
//
//  Created by Luann Luna on 25/04/22.
//

import Foundation

enum LoadingState {
    case none, loading, success, failed
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
