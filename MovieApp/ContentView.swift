//
//  ContentView.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct ContentView: View {
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
        }
    }
}

#Preview {
    ContentView()
}
