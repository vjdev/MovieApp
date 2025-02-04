//
//  WeatherEndpoint.swift
//  NewsApp With SwiftUI Framework
//
//  Created by Алексей Воронов on 30.09.2019.
//  Copyright © 2019 Алексей Воронов. All rights reserved.
//

import Foundation

enum MovieServiceEndpoint: EndpointProtocol {
    case getMovieName(searchString: String)
    case trendingMovie
    var baseURL: String {
        return "https://api.themoviedb.org/3"
    }
    
    var absoluteURL: String {
        switch self {
        case .getMovieName:
            return baseURL
        case .trendingMovie:
            return "\(baseURL)/trending/movie/day"
        }
    }
    
    var params: [String : String] {
        switch self {
        case let .getMovieName(searchString):
            return ["t": searchString, "apikey": "d29d5f8"]
        case .trendingMovie:
            return ["language": "en-US"]
        }
    }
    
    var headers: [String : String] {
        return [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYjVkNTE3MGNlNDMwMzFhNjA3OTg3ZWQ1NjUxZDA1ZiIsIm5iZiI6MTU3MDQ2MTEzNy4yOTksInN1YiI6IjVkOWI1NWQxOGU4NzAyMDAzMmYxNDczMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XdiFTLo65SQrqqwWtMHbfyCUDUDFX6gIwm4-oa8r3r0",
            "Accept": "application/json"
        ]
    }
}
