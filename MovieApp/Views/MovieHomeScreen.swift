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
            .navigationDestination(item: $selectedMovieID) { id in
                MovieDetailView(movieId: id)
            }
            .onAppear {
                viewModel.getTrendingMovie()
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
