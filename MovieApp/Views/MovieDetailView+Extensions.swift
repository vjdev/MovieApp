//
//  MovieDetailView+Extensions.swift
//  MovieApp
//
//  Created by vijeesh k on 13/02/25.
//

import SwiftUI

extension MovieDetailView {
    var movieTitle: some View {
         Text(viewModel.movieDetails?.title ?? "")
            .foregroundColor(.black)
            .font(.title)
            .lineLimit(0)
    }
    var rating: some View {
        HStack {
            StarIconView()
            if viewModel.movieDetails?.voteAverage != nil {
                RatingView(rating: viewModel.getRating())
            }
        }
    }
    
    var wishListButton: some View {
        Button {
        } label: {
            Image(systemName: "bookmark")
        }
    }
    
    var titleView: some View {
        HStack {
            movieTitle
            Spacer()
            wishListButton
        }
    }
    
    var descriptionView: some View {
        VStack(alignment: .leading) {
            Text(Constants.description)
                .font(.headline)
                .padding(.bottom, Constants_UI.Padding.xLarge)
            Text(viewModel.movieDetails?.overview ?? "")
                .font(.body)
        }
    }
}
//#Preview {
//    MovieDetailView()
//}
