//
//  MovieDetails.swift
//  MovieApp
//
//  Created by vijeesh k on 05/02/25.
//

struct MovieDetails {
    let adult: Bool?
    let backdropPath: String?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbID: String?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
    let spokenLanguages: [SpokenLanguage]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
}

// MARK: - Genre
struct Genre {
    let id: Int?
    let name: String?
}

// MARK: - ProductionCompany
struct ProductionCompany {
    let id: Int?
    let logoPath: String?
    let name: String?
    let originCountry: String?
}

// MARK: - ProductionCountry
struct ProductionCountry {
    let iso3166_1: String?
    let name: String?
}

// MARK: - SpokenLanguage
struct SpokenLanguage {
    let englishName: String?
    let iso639_1: String?
    let name: String?
}
