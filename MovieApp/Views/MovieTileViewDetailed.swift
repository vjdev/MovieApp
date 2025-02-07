//
//  MovieTileViewDetailed.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct MovieTileViewDetailed: View {
    var body: some View {
        HStack {
            movieImage
            movieDetails
        }
    }
}

#Preview {
    MovieTileViewDetailed()
}

extension MovieTileViewDetailed {
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
    
    var movieDetails: some View {
        VStack(alignment: .leading) {
            movieTitle
            rating
            genreView
            runningTime
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
    
    var runningTime: some View {
        HStack {
            timeIcon
            timeLabel
        }
    }
    
    var timeIcon: some View {
        Image(systemName: "clock.arrow.circlepath")
    }
    
    var timeLabel: some View {
        Text("1h 47m")
    }
}

