//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Luann Luna on 25/04/22.
//

import Foundation

class MovieListViewModel: ViewModelBase {
    
    @Published var movies: [MovieViewModel] = []
    let httpClient = HTTPClient()
    
    func searchByName(name: String) {
        
        guard !name.isEmpty else { return }
        
        httpClient.getMoviesBy(search: name.trimmedAndEscaped) { result in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                        self.loadingState = .success
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
}

struct MovieViewModel {
    let movie: Movie
    
    var imdbId: String { movie.imdbID }
    var title: String { movie.title }
    var poster: String { movie.poster }
    var year: String { movie.year }
}
