//
//  MovieDetailView.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import SwiftUI

struct MovieDetailView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                titleView
                rating
            }
            movieGenre
            HStack() {
                length
                language
                certificate
                Spacer()
            }
            .padding(.bottom, 20)
            descriptionView
            castSection
        }
        .padding(20)
    }
}

extension MovieDetailView {
    var movieTitle: some View {
        Text("Spiderman: No Way Home")
            .foregroundColor(.black)
            .font(.title)
            .lineLimit(0)
    }
    
    var starIcon: some View {
        Image(systemName: "star.fill")
            .foregroundStyle(.yellow)
    }
    
    var ratingVLabel: some View {
        Text("9.1/10 IMDb")
            .foregroundStyle(.gray)
            .font(.caption)
    }
    var rating: some View {
        HStack {
            starIcon
            ratingVLabel
        }
    }
    
    var wishListButton: some View {
        Button {
            
        } label: {
            Image(systemName: "bookmark")
        }

    }
    
    var titleView: some View {
        HStack {
            movieTitle
            Spacer()
            wishListButton
        }
    }
    
    var genreView: some View {
        Text("Horror")
            .frame(height: 10)
            .padding(.horizontal, 5)
            .padding(.vertical, 5)
            .foregroundColor(.white)
            .font(.caption2)
            .background(Capsule().fill(Color.cyan))
    }
    
    var movieGenre: some View {
        HStack {
            genreView
            genreView
            genreView
            Spacer()
        }
    }
    
    var length: some View {
        DoubleDeckerDetailView(topTitle: "Length", bottomTitle: "2h 28min")
    }
    
    var language: some View {
        DoubleDeckerDetailView(topTitle: "Language", bottomTitle: "English")
    }
    
    var certificate: some View {
        DoubleDeckerDetailView(topTitle: "Rating", bottomTitle: "PG-13")

    }
    
    var descriptionView: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .font(.headline)
                .padding(.bottom, 20)
            Text("Peter Parker's secret identity is revealed to the entire world. Desperate for help, Peter turns to Doctor Strange to make the world forget that he is Spider-Man. The spell goes horribly wrong and shatters the multiverse, bringing in monstrous villains that could destroy the world.")
                .font(.body)
        }
    }
    
    var castSection: some View {
        VStack(alignment: .leading) {
            HeaderView()
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    castView
                    castView
                    castView
                    castView
                    castView
                    castView
                }
            }
        }
    }
    
    var castView: some View {
        VStack(alignment: .leading) {
            actorName
            actorImage
        }
        .frame(width: 120, height: 150)
        
    }
    
    var actorName: some View {
        Text("Tom Holland")
    }
    
    var actorImage: some View {
        Image("spiderman", bundle: .main)
            .resizable()
            .cornerRadius(10)
    }
}

#Preview {
    MovieDetailView()
}
