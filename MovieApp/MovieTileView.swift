//
//  MovieTileView.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct MovieTileViewDetails {
   let movieImageURL: URL?
   let movieTitle: String
   let movieRating: String
}

struct MovieTileView: View {
    private let movieDetails: MovieTileViewDetails
    
    init(movieDetails: MovieTileViewDetails) {
        self.movieDetails = movieDetails
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            movieImage
            movieTitle
            rating
        }
    }
}

extension MovieTileView {
    var movieImage: some View {
        AsyncImage(url: movieDetails.movieImageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 100, height: 100)
            case .success(let image):
                image.resizable()
                    .cornerRadius(20)
                    .scaledToFit()
                    .frame(width: 200, height: 400)
                    .cornerRadius(20)
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(20)
                    .scaledToFit()
                    .frame(width: 200, height: 400)
                    
            @unknown default:
                EmptyView()
            }
        }
    }
    
    var movieTitle: some View {
        Text(movieDetails.movieTitle)
            .foregroundColor(.black)
            .font(.title)
            .lineLimit(0)
    }
    
    var starIcon: some View {
        Image(systemName: "star.fill")
            .foregroundStyle(.yellow)
    }
    
    var ratingLabel: some View {
        Text(movieDetails.movieRating)
            .foregroundStyle(.gray)
            .font(.caption)
    }
    var rating: some View {
        HStack {
            starIcon
            ratingLabel
        }
    }
}
