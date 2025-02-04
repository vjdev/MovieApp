//
//  MovieHomeScreen.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct MovieHomeScreen: View {
    var viewModel: MovieHomeScreenViewModel = MovieHomeScreenViewModel(service: MovieService())
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    HeaderView()
                    ScrollView(.horizontal) {
                        HStack {
                            MovieTileView()
                            MovieTileView()
                            MovieTileView()
                            MovieTileView()
                        }
                    }
                    HeaderView()
                    MovieTileViewDetailed()
                    Spacer()
                }
            }
            .padding()
            .navigationTitle("Now Showing")
            .navigationBarTitleDisplayMode(.large)
        }.onAppear {
            viewModel.getTrendingMovie()
        }
    }
}

#Preview {
    MovieHomeScreen()
}
