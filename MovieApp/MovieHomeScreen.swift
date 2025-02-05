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
                    HeaderView()
                    showHorizontalScrollingMovieTiles()
                    HeaderView()
                    MovieTileViewDetailed()
                    Spacer()
                }
            }
            .padding()
            .navigationTitle("Now Showing")
            .navigationBarTitleDisplayMode(.large)
        }.onAppear {
            viewModel.getTrendingMovie()
        }
    }
    
    @ViewBuilder
    func showHorizontalScrollingMovieTiles() -> some View {
        if let results = viewModel.trendingMovies?.results {
            NavigationStack {
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
                .navigationDestination(item: $selectedMovieID) { id in
                    MovieDetailView(movieId: selectedMovieID)
                }
            }
        }
    }
}



#Preview {
    MovieHomeScreen()
}
//
//struct HomeView: View {
//    @State private var selectedMovie: MovieDetails?
//    
//    var body: some View {
//        NavigationStack {
//            HStack {
//                ForEach(results, id: \.self) { data in
//                    let movieDetails = viewModel.getMovieDetails(data)
//                    
//                    MovieTileView(movieDetails: movieDetails)
//                        .frame(width: 200, height: 400)
//                        .onTapGesture {
//                            selectedMovie = movieDetails
//                        }
//                }
//            }
//            .navigationDestination(item: $selectedMovie) { movie in
//                MovieDetailView(movie: movie)
//            }
//        }
//    }
//}
