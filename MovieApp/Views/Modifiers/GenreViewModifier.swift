//
//  GenreViewModifier.swift
//  MovieApp
//
//  Created by vijeesh k on 13/02/25.
//

import SwiftUI

struct GenreViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 10)
            .padding(.horizontal, Constants_UI.Padding.medium)
            .padding(.vertical, Constants_UI.Padding.medium)
            .foregroundColor(.white)
            .font(.caption2)
            .background(Capsule().fill(Color.cyan))
    }
}
