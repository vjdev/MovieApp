//
//  MovieTileView.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct MovieTileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            movieImage
            movieTitle
            rating
        }
    }
}

#Preview {
    MovieTileView()
}

extension MovieTileView {
    var movieImage: some View {
        Image("spiderman", bundle: .main)
            .cornerRadius(20)
    }
    
    var movieTitle: some View {
        Text("Spiderman: No Way Home")
            .foregroundColor(.black)
            .font(.title)
            .lineLimit(0)
    }
    
    var starIcon: some View {
        Image(systemName: "star.fill")
            .foregroundStyle(.yellow)
    }
    
    var ratingVLabel: some View {
        Text("9.1/10 IMDb")
            .foregroundStyle(.gray)
            .font(.caption)
    }
    var rating: some View {
        HStack {
            starIcon
            ratingVLabel
        }
    }
}
