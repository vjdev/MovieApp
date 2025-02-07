//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by vijeesh k on 05/02/25.
//

import Foundation
import Combine

final class MovieDetailViewModel: ObservableObject {
    private let service: MovieServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    @Published private(set) var movieDetails: MovieDetails?
    private let movieID: Int?
    init(service: MovieServiceProtocol, movieID: Int?) {
        self.service = service
        self.movieID = movieID
    }
   
    func getMovieDetails() {
        service.getMovieDetails(movieID: movieID)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { movieDetails in
                self.movieDetails = movieDetails
            }.store(in: &cancellables)
    }
    
    func getRating() -> String {
        if let rating = movieDetails?.voteAverage {
            return String(rating)
        }
        return ""
    }
    
    func getMoviePoster() -> URL? {
        var fullPath = ""
        if let backdropPath = movieDetails?.posterPath {
            fullPath = ("https://image.tmdb.org/t/p/original/\(backdropPath)")
        }
        let url = URL(string: fullPath)
        return url
    }
}
