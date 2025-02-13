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
            PosterImageView(movieTileDetails.movieImageString)
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

