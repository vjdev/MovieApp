//
//  HeaderView.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            title
            Spacer()
            seeMoreButton
        }
        .padding(20
        )
    }
}

extension HeaderView {
    var title: some View {
        Text("Popular")
    }
    
    var seeMoreButton: some View {
        Button {
            
        } label: {
            Text("See more")
                .foregroundColor(.white)
                .frame(width: 80, height: 15)
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                .background(Capsule().fill(.gray))
                
        }
    }
}
#Preview {
    HeaderView()
}
