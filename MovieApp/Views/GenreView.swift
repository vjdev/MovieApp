//
//  GenreView.swift
//  MovieApp
//
//  Created by vijeesh k on 13/02/25.
//

import SwiftUI

struct GenreView: View {
    var title: String
    var body: some View {
        Text(title)
            .modifier(GenreViewModifier())
    }
}
