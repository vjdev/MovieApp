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
        VStack(alignment: .leading, spacing: 2) {
            movieImage
            movieTitle
            rating
        }
    }
}
#Preview {
    MovieTileView(movieDetails: MovieTileViewDetails(movieImageURL: nil,
                                                     movieTitle: "Spiderman Back to Home town", movieRating: "10/10 IMDb"))
}

extension MovieTileView {
    var movieImage: some View {
        AsyncImage(url: movieDetails.movieImageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 200, height: 320)
            case .success(let image):
                image.resizable()
                    .cornerRadius(20)
                    .scaledToFit()
                    .frame(width: 200, height: 320)
                    .cornerRadius(20)
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
        Text(movieDetails.movieTitle)
            .multilineTextAlignment(.leading)
            .foregroundColor(.black)
            .font(.title3)
            .lineLimit(2)
            .padding(.trailing, 2)
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
