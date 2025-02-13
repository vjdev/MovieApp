//
//  RatingView.swift
//  MovieApp
//
//  Created by vijeesh k on 12/02/25.
//

import SwiftUI

struct RatingView: View {
    var rating: String
    var body: some View {
        Text("\(rating)/\(Constants.imdb)")
            .foregroundStyle(.gray)
            .font(.caption)
    }
}

#Preview {
    RatingView(rating: "5")
}
