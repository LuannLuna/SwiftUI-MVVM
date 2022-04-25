//
//  MovieDetailScene.swift
//  Movies
//
//  Created by Luann Luna on 25/04/22.
//

import SwiftUI

struct MovieDetailScene: View {
    
    let imdbId: String
    
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack {
            if movieDetailViewModel.loadingState == .loading {
                Text("Loading...")
            } else if movieDetailViewModel.loadingState == .success {
                MoviewDetailView(viewModel: movieDetailViewModel)
            } else if movieDetailViewModel.loadingState == .failed {
                FailedView()
            }
        }.onAppear {
            self.movieDetailViewModel.getDetailsByImdbId(imdbId: self.imdbId)
        }
    }
}
