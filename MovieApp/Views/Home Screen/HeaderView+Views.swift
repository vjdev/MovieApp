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
                .foregroundColor(.white)
                .frame(width: 80, height: 15)
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                .background(Capsule().fill(.gray))
                
        }
    }
}
