//
//  EndpointProtocol.swift
//  MovieSample
//
//  Created by vijeesh k on 28/01/25.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String { get }
    var absoluteURL: String { get }
    var params: [String: String] { get }
    var headers: [String: String] { get }
}
