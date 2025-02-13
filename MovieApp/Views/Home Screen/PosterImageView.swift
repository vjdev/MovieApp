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
                        .frame(width: 200, height: 320)
                case .success(let image):
                    image.resizable()
                        .cornerRadius(20)
                        .scaledToFill()
                        .cornerRadius(20)
                        .frame(maxWidth: .infinity)
                case .failure:
                    Image(systemName: "unAvailable")
                        .resizable()
                        .cornerRadius(20)
                        .scaledToFit()
                        .frame(width: 200, height: 320)
                @unknown default:
                    EmptyView()
                }
            }
    }
}

