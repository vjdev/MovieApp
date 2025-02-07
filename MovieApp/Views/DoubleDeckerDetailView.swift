//
//  DoubleDeckerDetailView.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct DoubleDeckerDetailView: View {
init(topTitle: String, bottomTitle: String) {
        self.topTitle = topTitle
        self.bottomTitle = bottomTitle
    }
    
    let topTitle: String
    let bottomTitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(topTitle)
            Text(bottomTitle)
        }
    }
}

#Preview {
    DoubleDeckerDetailView(topTitle: "Hello", bottomTitle: "World")
}
