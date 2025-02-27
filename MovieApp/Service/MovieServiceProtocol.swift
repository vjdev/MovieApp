//
//  MovieServiceProtocol.swift
//  MovieApp
//
//  Created by vijeesh k on 03/02/25.
//

import Foundation
import Combine
protocol MovieServiceProtocol {
    func trendingMovies() -> AnyPublisher<MovieTrending?, APIErrors>
    func getMovieDetails(movieID: Int?) -> AnyPublisher<MovieDetails?, APIErrors>
    func upComingMovies(_ page: String) -> AnyPublisher<UpcomingMovieDetailsModel?, APIErrors>
}

