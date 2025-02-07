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
    
    func upComingMovies(_ page: String) -> AnyPublisher<UpcomingMovieDetailsModel?, APIErrors> {
        apiProvider.getData(from: .upcoming(page: page))
            .tryMap { data -> UpcomingMovieDetailsModel? in
                do {
                    return try JSONDecoder().decode(UpcomingMovieDetailsModel.self, from: data)
                } catch {
                    throw APIErrors.serverError
                }
            }
            .mapError { _ in APIErrors.decodingError }
            .eraseToAnyPublisher()
    }
    
    func getMovieDetails(movieID: Int?) -> AnyPublisher<MovieDetails?, APIErrors> {
        apiProvider.getData(from: .movieDetails(movieID: movieID))
            .handleEvents(receiveOutput: { data in
                print("Raw Data: \(String(data: data, encoding: .utf8) ?? "Invalid Data")")
            })
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
