//
//  MovieHomeScreenViewModel.swift
//  MovieApp
//
//  Created by vijeesh k on 03/02/25.
//

import Foundation
import Combine
final class MovieHomeScreenViewModel: ObservableObject {
    private let service: MovieServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    @Published var selectedMovieID: Int?
    @Published private(set) var trendingMovies: MovieTrending?
    init(service: MovieServiceProtocol) {
        self.service = service
    }
    
    func getTrendingMovie() {
        service.trendingMovies()
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { movieTrending in
                self.trendingMovies = movieTrending
            }.store(in: &cancellables)
    }
    
    private func getMoviePoster(_ result: Result) -> URL? {
        var fullPath = ""
        if let backdropPath = result.posterPath {
            fullPath = ("https://image.tmdb.org/t/p/original/\(backdropPath)")
        }
        let url = URL(string: fullPath)
        return url
    }
    
    func getMovieDetails(_ result: Result) -> MovieTileViewDetails {
        let details = MovieTileViewDetails(movieImageURL: getMoviePoster(result),
                                           movieTitle: result.title ?? "",
                                           movieRating: "\(result.voteAverage ?? 0)/10 IMDb")
        return details
    }
}
