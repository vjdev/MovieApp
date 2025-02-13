//
//  CordinatorView.swift
//  MovieApp
//
//  Created by vijeesh k on 13/02/25.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var router = Router()

    var body: some View {
        NavigationStack(path: $router.path) {
            MovieHomeScreen() // Root View
                .navigationDestination(for: Destination.self) { destination in
                    switch destination {
                    case .detailScreen(let movieId):
                        MovieDetailView(movieId: movieId)
                    }
                }
        }
        .environmentObject(router)
    }
}

final class Router: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ destination: Destination) {
        path.append(destination)
    }

    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func popToRoot() {
        path = NavigationPath()
    }
}

enum Destination: Hashable {
    case detailScreen(movieId: Int)
}
