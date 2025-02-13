//
//  MovieDetailView.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject var viewModel: MovieDetailViewModel
    init(service: MovieServiceProtocol = MovieService(), movieId: Int?) {
        _viewModel = StateObject(wrappedValue: MovieDetailViewModel(service: service, movieID: movieId))
    }
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                VStack(alignment: .leading) {
                    PosterImageView(viewModel.getMoviePoster())
                    titleView
                    rating
                }
                HStack {
                    showMovieGenre()
                    Spacer()
                }
                .padding(.bottom, Constants_UI.Padding.xLarge)
                descriptionView
            }
            .padding(Constants_UI.Padding.xLarge)
            .onAppear {
                viewModel.getMovieDetails()
            }
        }
    }
    
    @ViewBuilder
    func showMovieGenre() -> some View {
        if let genre = viewModel.movieDetails?.genres {
            ForEach(genre, id: \.self) { genre in
                GenreView(title: genre.name)
            }
        }
        EmptyView()
    }
}
