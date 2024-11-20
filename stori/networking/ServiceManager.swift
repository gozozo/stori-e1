//
//  ServiceManager.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 18/11/24.
//

import UIKit

/// ServiceManager is responsible for handling network service requests.
/// This class provides methods to perform network operations and manage
/// the responses from various services.
class ServiceManager {
    
    static let shared = ServiceManager()
    
    private init() {}
    
    
    /// Fetches a list of movies from the service.
    ///
    /// - Parameter completion: A closure that gets called with the result of the fetch operation.
    ///   The closure takes a `Result` containing either an array of `Movie` objects or an `Error`.
    ///
    /// - Returns: Void
    func fetchMovies(completion: @escaping (Result<MoviesResponse, Error>) -> Void) {
        guard let url = ApiService.getFullURL(for: .topRatedMovies) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let deviceLanguage = Locale.current.language.languageCode?.identifier ?? "en"
        
        let queryString: [String: Any] = [
            "language": deviceLanguage,
            "page": "1",
        ]
        
        let task = URLSession.shared.dataTask(with: builtRequest(url: url, queryString: queryString)) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }

            let movies = try! JSONDecoder().decode(MoviesResponse.self, from: data)
            completion(.success(movies))

        }
        
        task.resume()
    }
    
    /// Fetches an image from a given resource path.
    ///
    /// This method asynchronously downloads an image from the specified resource path
    /// and returns it via the completion handler.
    ///
    /// - Parameters:
    ///   - resource: The path to the image resource.
    ///   - completion: A closure that gets called with the fetched `UIImage` object or `nil` if the image could not be fetched.
    ///
    /// - Note: The image is fetched using a URL constructed by `ApiService.getImagesURL(size:path:)`.
    ///
    func fetchImage(resource: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = ApiService.getImagesURL(size: "/w200", path: resource) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    // MARK: - Private Methods
    
    /// Builds a `URLRequest` object with the specified URL and query
    ///
    /// - Parameters:
    ///  - url: The URL for the request.
    ///  - queryString: An optional dictionary of query parameters.
    ///  - Returns: A `URLRequest` object.
    private func builtRequest(url: URL, queryString:[String: Any]?) -> URLRequest {
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = queryString?.map { (key, value) in
            URLQueryItem(name: key, value: String(describing: value))
        }
        
        var request = URLRequest(url: components?.url ?? url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer \(Constants.apiKey ?? "")", forHTTPHeaderField: "Authorization")
        
        return request
    }
}
