//
//  HeaderView+Views.swift
//  MovieApp
//
//  Created by vijeesh k on 12/02/25.
//

import SwiftUI

extension HeaderView {
    var title: some View {
        Text(headerTitle)
            .font(.largeTitle)
            .fontWeight(.bold)
    }
    
    var seeMoreButton: some View {
        Button {
            
        } label: {
            Text(buttonTitle)
                .modifier(HeaderTitleModifier())
        }
    }
}

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
