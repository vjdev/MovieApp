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

#Preview {
    HeaderView(headerTitle: "Upcoming", buttonTitle: "See More")
}
