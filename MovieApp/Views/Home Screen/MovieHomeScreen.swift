//
//  MovieHomeScreen.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct MovieHomeScreen: View {
    @StateObject private var viewModel: MovieHomeScreenViewModel = MovieHomeScreenViewModel(service: MovieService())
    @State private var selectedMovieID: Int?
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    showHorizontalScrollingMovieTiles()
                    HeaderView(headerTitle: "Upcoming", buttonTitle: "See More")
                    showUpcomingMovies()
                    Spacer()
                }
            }
            .padding()
            .navigationTitle("Now Showing")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(item: $selectedMovieID) { id in
                MovieDetailView(movieId: id)
            }
            .onAppear {
                viewModel.getTrendingMovie()
                viewModel.getUpcomingMovies()
            }
        }
    }
    
    @ViewBuilder
    func showUpcomingMovies() -> some View {
        if let results = viewModel.upcomingMovies?.results {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(results, id: \.id) { data in
                        let posterPath = viewModel.getMoviePoster(data)
                        let movieDetails = MovieTileDetails(movieImageString: posterPath,
                                                            movieTitleString: data.title,
                                                            rating: viewModel.getRating(data))
                        MovieTitleDetailsView(movieTileDetails: movieDetails)
                            .onTapGesture {
                                selectedMovieID = data.id
                            }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func showHorizontalScrollingMovieTiles() -> some View {
        if let results = viewModel.trendingMovies?.results {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(results, id: \.self) { data in
                        MovieTileView(movieDetails: viewModel.getMovieDetails(data))
                            .frame(width: 200, height: 400)
                            .onTapGesture {
                                selectedMovieID = data.id
                            }
                    }
                }
            }
        }
    }
}



#Preview {
    MovieHomeScreen()
}
