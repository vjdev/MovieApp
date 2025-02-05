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
    private let movieID: String
    init(service: MovieServiceProtocol, movieID: String) {
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
}
