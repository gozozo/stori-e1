//
//  ApiService.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 18/11/24.
//

import Foundation

/// This structure helps manage the API base URL and endpoints, constructing the full URL for requests.
struct ApiService {
    
    // Base URL for the API
    static let baseURL = Constants.apiBaseUrl ?? ""
    static let imagesURL = Constants.imagesBaseUrl ?? ""
    
    // Enum to define all available API endpoints
    enum Endpoint {
        case topRatedMovies
        
        // Construct the path for each endpoint
        var path: String {
            switch self {
            case .topRatedMovies:
                return "/movie/top_rated"
            }
        }
    }
    
    // Static function to construct the full URL by appending the endpoint to the base URL
    static func getFullURL(for endpoint: Endpoint) -> URL? {
        return URL(string: baseURL + endpoint.path)
    }
    
    // Static function to construct the full URL by getting the images URL
    static func getImagesURL(size: String, path: String) -> URL? {
        return URL(string: imagesURL + size + path)
    }
}

