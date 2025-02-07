//
//  UpcomingMovieDetailsModel.swift
//  MovieApp
//
//  Created by vijeesh k on 07/02/25.
//

import Foundation

// MARK: - UpComingMovieDetails
struct UpcomingMovieDetailsModel: Codable {
    let dates: Dates?
    let page: Int?
    let results: [Result]?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates = "dates"
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum: String?
    let minimum: String?

    enum CodingKeys: String, CodingKey {
        case maximum = "maximum"
        case minimum = "minimum"
    }
}

