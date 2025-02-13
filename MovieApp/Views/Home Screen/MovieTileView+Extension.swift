//
//  MovieTileView+Extension.swift
//  MovieApp
//
//  Created by vijeesh k on 13/02/25.
//

import SwiftUI

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

