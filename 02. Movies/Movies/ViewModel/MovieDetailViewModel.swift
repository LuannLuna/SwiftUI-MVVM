//
//  MovieDetailViewModel.swift
//  Movies
//
//  Created by Luann Luna on 25/04/22.
//

import Foundation

class MovieDetailViewModel: ViewModelBase {
    
    private var movieDetail: MovieDetail?
    private var httpClient = HTTPClient()
    
    init(movieDetail: MovieDetail? = nil) {
        super.init()
        self.movieDetail = movieDetail
        loadingState = .loading
    }
    
    func getDetailsByImdbId(imdbId: String) {
        httpClient.getMovieDetailsBy(imdbId: imdbId) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.movieDetail = response
                    self.loadingState = .success
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
    
    var title: String { movieDetail?.title ?? "" }
    var poster: String { movieDetail?.poster ?? "" }
    var plot: String { movieDetail?.plot ?? "" }
    var director: String { movieDetail?.director ?? "" }
    var rating: Int {
        get {
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
}
