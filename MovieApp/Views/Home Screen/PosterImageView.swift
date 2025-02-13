//
//  PosterImageView.swift
//  MovieApp
//
//  Created by vijeesh k on 13/02/25.
//

import SwiftUI

struct PosterImageView: View {
    init(_ moviePoster: URL? = nil) {
        self.moviePoster = moviePoster
    }
    
    var moviePoster: URL?
    var body: some View {
            AsyncImage(url: moviePoster) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: Constants_UI.movieImageWidth, height: Constants_UI.movieImageHeight)
                case .success(let image):
                    image.resizable()
                        .cornerRadius(Constants_UI.cornerRadius)
                        .scaledToFill()
//                        .frame(maxWidth: .infinity)
                        .frame(width: Constants_UI.movieImageWidth, height: Constants_UI.movieImageHeight)
                case .failure:
                    Image(systemName: "unAvailable")
                        .resizable()
                        .cornerRadius(Constants_UI.cornerRadius)
                        .scaledToFit()
                        .frame(width: Constants_UI.movieImageWidth, height: Constants_UI.movieImageHeight)
                @unknown default:
                    EmptyView()
                }
            }
    }
}

