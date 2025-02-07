//
//  WeatherEndpoint.swift
//  NewsApp With SwiftUI Framework
//
//  Created by Алексей Воронов on 30.09.2019.
//  Copyright © 2019 Алексей Воронов. All rights reserved.
//

import Foundation

enum MovieServiceEndpoint: EndpointProtocol {
    case trendingMovie
    case movieDetails(movieID: Int?)
    var baseURL: String {
        return "https://api.themoviedb.org/3"
    }
    
    var absoluteURL: String {
        switch self {
        case .trendingMovie:
            return "\(baseURL)/trending/movie/day"
        case .movieDetails(let movieID):
            if let movieID = movieID {
                let movieIDStringValue = String(movieID)
                return "\(baseURL)/movie/\(movieIDStringValue)"
            } else {
                return "\(baseURL)/movie"
            }
        }
    }
    
    var params: [String : String] {
        switch self {
        case .trendingMovie:
            return ["language": "en-US"]
        default:
            return [:]
        }
    }
    
    var headers: [String : String] {
        return [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYjVkNTE3MGNlNDMwMzFhNjA3OTg3ZWQ1NjUxZDA1ZiIsIm5iZiI6MTU3MDQ2MTEzNy4yOTksInN1YiI6IjVkOWI1NWQxOGU4NzAyMDAzMmYxNDczMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XdiFTLo65SQrqqwWtMHbfyCUDUDFX6gIwm4-oa8r3r0",
            "Accept": "application/json"
        ]
    }
}
