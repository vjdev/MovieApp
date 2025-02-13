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
