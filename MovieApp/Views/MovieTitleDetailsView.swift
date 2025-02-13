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
