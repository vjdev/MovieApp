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
        VStack(alignment: .leading, spacing: Constants_UI.Padding.min) {
            PosterImageView(movieDetails.movieImageURL)
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
    var movieTitle: some View {
        Text(movieDetails.movieTitle)
            .multilineTextAlignment(.leading)
            .foregroundColor(.black)
            .font(.title3)
            .lineLimit(2)
            .padding(.trailing, Constants_UI.Padding.min)
    }
        
    var ratingLabel: some View {
        Text(movieDetails.movieRating)
            .foregroundStyle(.gray)
            .font(.caption)
    }
    var rating: some View {
        HStack {
            StarIconView()
            RatingView(rating: movieDetails.movieRating)
        }
    }
}

struct Constants_UI {
    static let cornerRadius: CGFloat = 20
    static let movieImageHeight: CGFloat = 320
    static let movieImageWidth: CGFloat = 200
    static let unAvailableImage: String = "unAvailable"
    struct Padding {
        static let min: CGFloat = 2
        static let medium: CGFloat = 5
        static let xLarge: CGFloat = 20
    }
}
