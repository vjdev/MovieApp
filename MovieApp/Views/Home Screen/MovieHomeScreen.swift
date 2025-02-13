//
//  MovieHomeScreen.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct MovieHomeScreen: View {
    @StateObject private var viewModel: MovieHomeScreenViewModel = MovieHomeScreenViewModel(service: MovieService())
    @EnvironmentObject var router: Router
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                showHorizontalScrollingMovieTiles()
                HeaderView(headerTitle: Constants.upcoming, buttonTitle: Constants.seeMore)
                showUpcomingMovies()
                Spacer()
            }
        }
        .padding()
        .navigationTitle(Constants.nowShowing)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.getTrendingMovie()
            viewModel.getUpcomingMovies()
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
                                if let movieId = data.id {
                                    router.push(.detailScreen(movieId: movieId))
                                }
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
                HStack(spacing: Constants_UI.Padding.xxLarge) {
                    ForEach(results, id: \.self) { data in
                        MovieTileView(movieDetails: viewModel.getMovieDetails(data))
                            .frame(width: 200, height: 400)
                            .onTapGesture {
                                if let movieId = data.id {
                                    router.push(.detailScreen(movieId: movieId))
                                }
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
