//
//  MovieTileViewDetailed.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct MovieTileDetails {
    let movieImageString: URL?
    let movieTitleString: String?
    let rating: String

}
struct MovieTitleDetailsView: View {
    init(movieTileDetails: MovieTileDetails) {
        self.movieTileDetails = movieTileDetails
    }
    
    let movieTileDetails: MovieTileDetails
    var body: some View {
        HStack {
            movieImage
            movieDetails
            Spacer()
        }
        .frame(width: 400)
    }
}

//#Preview {
//    MovieTileViewDetailed()
//}

extension MovieTitleDetailsView {
    var movieImage: some View {
        AsyncImage(url: movieTileDetails.movieImageString) { phase in
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
        Text(movieTileDetails.movieTitleString ?? "")
            .foregroundColor(.black)
            .font(.title3)
            .lineLimit(3)
    }
    
    var starIcon: some View {
        Image(systemName: "star.fill")
            .foregroundStyle(.yellow)
    }
    
    var ratingLabel: some View {
        Text("\(movieTileDetails.rating)/10 IMDb")
            .foregroundStyle(.gray)
            .font(.caption)
        
    }
    var rating: some View {
        HStack {
            starIcon
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

