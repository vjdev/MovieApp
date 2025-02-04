//
//  MovieTileView.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct MovieTileView: View {
    init(movieImageURL: URL?) {
        self.movieImageURL = movieImageURL
    }
    
    private let movieImageURL: URL?
    var body: some View {
        VStack(alignment: .leading) {
            movieImage
            movieTitle
            rating
        }
    }
}

//#Preview {
//    MovieTileView()
//}

extension MovieTileView {
    var movieImage: some View {
        AsyncImage(url: movieImageURL) { phase in
            switch phase {
            case .empty:
                ProgressView() // Show a loading indicator
                    .frame(width: 100, height: 100)
            case .success(let image):
                image.resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 400)
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 400)
            @unknown default:
                EmptyView()
            }
        }
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
