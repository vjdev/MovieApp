//
//  WeatherEndpoint.swift
///  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import Foundation

enum MovieServiceEndpoint: EndpointProtocol {
    case trendingMovie
    case movieDetails(movieID: Int?)
    case upcoming(page:String = "1")
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
        case .upcoming:
            return "\(baseURL)/movie/upcoming"
        }
    }
    
    var params: [String : String] {
        switch self {
        case .trendingMovie:
            return ["language": "en-US"]
        case .upcoming(let page):
            return ["page": page]
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
