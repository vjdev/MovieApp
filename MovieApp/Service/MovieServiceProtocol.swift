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
}

