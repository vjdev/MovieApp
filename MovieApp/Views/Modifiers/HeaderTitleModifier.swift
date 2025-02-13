//
//  HeaderTitleModifier.swift
//  MovieApp
//
//  Created by vijeesh k on 13/02/25.
//

import SwiftUI
struct HeaderTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(width: 80, height: 15)
            .padding(.horizontal, Constants_UI.Padding.medium)
            .padding(.vertical, Constants_UI.Padding.medium)
            .background(Capsule().fill(.gray))
    }
}
