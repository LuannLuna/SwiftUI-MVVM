//
//  MovieListScene.swift
//  Movies
//
//  Created by Luann Luna on 25/04/22.
//

import SwiftUI

struct MovieListScene: View {
    
    @ObservedObject private var movieListViewModel: MovieListViewModel
    @State private var movieName = String()
    
    init() {
        movieListViewModel = MovieListViewModel()
    }
    
    var body: some View {
        VStack {
            TextField("Search", text: $movieName) {
                self.movieListViewModel.searchByName(name: self.movieName)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
                .navigationBarTitle("Movies")
            
            if movieListViewModel.loadingState == .success {
                MovieListView(movies: movieListViewModel.movies)
            } else if movieListViewModel.loadingState == .failed {
                FailedView()
            }
        }
        .padding()
        .embedNavigationView()
    }
}

struct MovieListScene_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScene()
    }
}
