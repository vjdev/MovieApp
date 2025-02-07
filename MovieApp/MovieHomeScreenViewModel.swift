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
    @Published private(set) var upcomingMovies: UpcomingMovieDetailsModel?
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
    
    func getUpcomingMovies(_ page: String = "1") {
        service.upComingMovies(page)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { upcomingMovies in
                self.upcomingMovies = upcomingMovies
            }.store(in: &cancellables)
    }
    
    func getMoviePoster(_ result: Result) -> URL? {
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
    
    func getRating(_ data: Result?) -> String {
        if let rating = data?.voteAverage {
            return String(rating)
        }
        return ""
    }
}
