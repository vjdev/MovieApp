//
//  MovieTitleDetailsView+Extension.swift
//  MovieApp
//
//  Created by vijeesh k on 13/02/25.
//

import SwiftUI
extension MovieTitleDetailsView {
    var movieTitle: some View {
        Text(movieTileDetails.movieTitleString ?? "")
            .foregroundColor(.black)
            .font(.title3)
            .lineLimit(3)
    }
    
    var ratingLabel: some View {
        Text("\(movieTileDetails.rating)/\(Constants.imdb)")
            .foregroundStyle(.gray)
            .font(.caption)
        
    }
    var rating: some View {
        HStack {
            StarIconView()
            ratingLabel
        }
    }
    
    var movieDetails: some View {
        VStack(alignment: .leading) {
            movieTitle
            rating
        }
    }
    var timeIcon: some View {
        Image(systemName: "clock.arrow.circlepath")
    }
    
    var timeLabel: some View {
        Text("1h 47m")
    }
}

