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
                    movieImage
                    titleView
                    rating
                }
                HStack {
                    showMovieGenre()
                    Spacer()
                }
                .padding(.bottom, 20)
                descriptionView
            }
            .padding(20)
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
            .padding(.horizontal, 5)
            .padding(.vertical, 5)
            .foregroundColor(.white)
            .font(.caption2)
            .background(Capsule().fill(Color.cyan))
    }
}

extension MovieDetailView {
    var movieImage: some View {
        AsyncImage(url: viewModel.getMoviePoster()) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 200, height: 320)
            case .success(let image):
                image.resizable()
                    .cornerRadius(20)
                    .scaledToFill()
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity)
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(20)
                    .scaledToFit()
                    .frame(width: 200, height: 320)
            @unknown default:
                EmptyView()
            }
        }
    }
    var movieTitle: some View {
         Text(viewModel.movieDetails?.title ?? "")
            .foregroundColor(.black)
            .font(.title)
            .lineLimit(0)
    }
    
    var starIcon: some View {
        Image(systemName: "star.fill")
            .foregroundStyle(.yellow)
    }
    
    var ratingVLabel: some View {
        Text("\(viewModel.getRating())/10 IMDb")
            .foregroundStyle(.gray)
            .font(.caption)
    }
    var rating: some View {
        HStack {
            starIcon
            if viewModel.movieDetails?.voteAverage != nil {
                ratingVLabel
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
            .padding(.horizontal, 5)
            .padding(.vertical, 5)
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
    
    var length: some View {
        DoubleDeckerDetailView(topTitle: "Length", bottomTitle: "\(viewModel.movieDetails?.runtime ?? 0)")
    }
    
    var language: some View {
        DoubleDeckerDetailView(topTitle: "Language", bottomTitle: viewModel.movieDetails?.originalLanguage ?? "")
    }
    
    var certificate: some View {
        DoubleDeckerDetailView(topTitle: "Tagline", bottomTitle: viewModel.movieDetails?.tagline ?? "")

    }
    
    var descriptionView: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .font(.headline)
                .padding(.bottom, 20)
            Text(viewModel.movieDetails?.overview ?? "")
                .font(.body)
        }
    }
    
    var castSection: some View {
        VStack(alignment: .leading) {
            HeaderView(headerTitle: "Upcoming Movies", buttonTitle: "See More")
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    castView
                    castView
                    castView
                    castView
                    castView
                    castView
                }
            }
        }
    }
    
    var castView: some View {
        VStack(alignment: .leading) {
            actorName
            actorImage
        }
        .frame(width: 120, height: 150)
        
    }
    
    var actorName: some View {
        Text("Tom Holland")
    }
    
    var actorImage: some View {
        Image("spiderman", bundle: .main)
            .resizable()
            .cornerRadius(10)
    }
}

//#Preview {
//    MovieDetailView()
//}
