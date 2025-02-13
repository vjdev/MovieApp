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
    let movieDetails: MovieTileViewDetails
    
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
