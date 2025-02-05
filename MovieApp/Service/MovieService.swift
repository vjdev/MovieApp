//
//  MovieService.swift
//  MovieApp
//
//  Created by vijeesh k on 03/02/25.
//

import Foundation
import Combine
final class MovieService: MovieServiceProtocol {
    
    private var cancellables = Set<AnyCancellable>()
    var moviePassthrough = PassthroughSubject<MovieTrending, APIErrors>()
    private let apiProvider = APIProvider<MovieServiceEndpoint>()

    func trendingMovies() -> AnyPublisher<MovieTrending?, APIErrors> {
        apiProvider.getData(from: .trendingMovie)
            .tryMap { data -> MovieTrending? in
                do {
                    return try JSONDecoder().decode(MovieTrending.self, from: data)
                } catch {
                    throw APIErrors.serverError
                }
            }
            .mapError { _ in APIErrors.decodingError }
            .eraseToAnyPublisher()
    }
    
    func getMovieDetails(movieID: Int?) -> AnyPublisher<MovieDetails?, APIErrors> {
        apiProvider.getData(from: .movieDetails(movieID: movieID))
            .tryMap { data -> MovieDetails? in
                do {
                    return try JSONDecoder().decode(MovieDetails.self, from: data)
                } catch {
                    throw APIErrors.serverError
                }
            }
            .mapError { _ in APIErrors.decodingError }
            .eraseToAnyPublisher()
    }
}
