//
//  MovieDetailView.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject private var viewModel: MovieDetailViewModel
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
                Text(genre.name)
                    .modifier(GenreViewModifier())
            }
        }
        EmptyView()
    }
}

struct GenreViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 10)
            .padding(.horizontal, Constants_UI.Padding.medium)
            .padding(.vertical, Constants_UI.Padding.medium)
            .foregroundColor(.white)
            .font(.caption2)
            .background(Capsule().fill(Color.cyan))
    }
}

extension MovieDetailView {
    var movieTitle: some View {
         Text(viewModel.movieDetails?.title ?? "")
            .foregroundColor(.black)
            .font(.title)
            .lineLimit(0)
    }
    var rating: some View {
        HStack {
            StarIconView()
            if viewModel.movieDetails?.voteAverage != nil {
                RatingView(rating: viewModel.getRating())
            }
        }
    }
    
    var wishListButton: some View {
        Button {
        } label: {
            Image(systemName: "bookmark")
        }
    }
    
    var titleView: some View {
        HStack {
            movieTitle
            Spacer()
            wishListButton
        }
    }
    
    var genreView: some View {
        Text("Horror")
            .frame(height: 10)
            .padding(.horizontal, Constants_UI.Padding.medium)
            .padding(.vertical, Constants_UI.Padding.medium)
            .foregroundColor(.white)
            .font(.caption2)
            .background(Capsule().fill(Color.cyan))
    }
    
    var movieGenre: some View {
        HStack {
            genreView
            genreView
            genreView
            Spacer()
        }
    }
    
    var descriptionView: some View {
        VStack(alignment: .leading) {
            Text(Constants.description)
                .font(.headline)
                .padding(.bottom, Constants_UI.Padding.xLarge)
            Text(viewModel.movieDetails?.overview ?? "")
                .font(.body)
        }
    }
}

//#Preview {
//    MovieDetailView()
//}

struct Constants {
    static let upcoming = "Upcoming"
    static let seeMore = "See More"
    static let nowShowing = "Now Showing"
    static let description = "Description"
    static let imdb = "10 IMDb"
    
}
