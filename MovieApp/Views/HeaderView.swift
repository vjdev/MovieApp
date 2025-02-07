//
//  HeaderView.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct HeaderView: View {
    var headerTitle: String
    var buttonTitle: String
    var body: some View {
        HStack {
            title
            Spacer()
            seeMoreButton
            Spacer()
        }
        .padding(20
        )
    }
}

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
#Preview {
    HeaderView(headerTitle: "Upcoming", buttonTitle: "See More")
}
