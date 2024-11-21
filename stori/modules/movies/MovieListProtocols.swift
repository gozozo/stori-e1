//
//  MovieListProtocols.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 18/11/24.
//

import UIKit

// MARK: - Interactor Protocols
protocol MovieListInteractorProtocol {

    var presenter: MovieListPresenterProtocol? { get set }

    /// Fetches the list of movies from the data source.
    ///
    /// This method is responsible for initiating the process of retrieving
    /// movie information, which may involve network requests, database
    /// queries, or other forms of data fetching. The exact implementation
    /// details will depend on the conforming type.
    func fetchMovies()

    /// Fetches an image from the specified URL.
    /// - Parameters:
    ///   - resource: The resource from which to fetch the image
    ///   - completion: A closure to be called upon completion, with an optional UIImage if the fetch was successful.
    func fetchImage(from resource: String, completion: @escaping (UIImage?) -> Void)
}

// MARK: - Presenter Protocols
protocol MovieListPresenterProtocol: AnyObject {

    var view: MovieListViewProtocol? { get set }
    var interactor: MovieListInteractorProtocol? { get set }
    var router: MovieListRouterProtocol? { get set }

    /// Fetches the list of movies.
    ///
    /// This method is responsible for initiating the process of retrieving
    /// movie data, which may involve network requests, database queries,
    /// or other data sources. The implementation details are defined in the
    /// conforming types.
    func fetchMovies()

    /// Fetches the image for a given movie resource.
    /// 
    /// - Parameters:
    ///   - resource: The string identifier for the movie resource.
    ///   - completion: A closure that gets called with the fetched UIImage or nil if the image could not be fetched.
    func fetchImageMovie(for resource: String, completion: @escaping (UIImage?) -> Void)

    /// Notifies that the movies have been fetched successfully.
    /// - Parameter movies: An array of `Movie` objects that have been fetched.
    func moviesFetched(movies: [Movie])
    
    /// This function is called when fetching movies fails.
    /// - Parameter error: The error that occurred during the fetch operation.
    func moviesFetchFailed(error: Error)
    
    /// Returns the number of movies.
    ///
    /// - Returns: An integer representing the total number of movies.
    func numberOfMovies() -> Int

    /// Returns the movie at the specified index.
    ///
    /// - Parameter index: The index of the movie to retrieve.
    /// - Returns: The movie at the specified index.
    func movie(at index: Int) -> Movie
    
    /// Navigates to the movie detail view for the movie at the specified index.
    /// - Parameter index: The index of the movie in the list.
    func navigateToMovieDetail(at index: Int)
}

// MARK: - View Protocols
protocol MovieListViewProtocol: AnyObject {
    var presenter: MovieListPresenterProtocol? { get set }
    
    /// Reloads the data for the movie list.
    ///
    /// This method should be called to refresh the movie list data, typically after
    /// data has been updated or fetched from a remote source.
    func reloadData()
    
    /// Displays an error message to the user.
    /// - Parameter message: A string containing the error message to be shown.
    func showError(message: String)
}

// MARK: - Router Protocols
protocol MovieListRouterProtocol {
    /// Creates and returns a new instance of the module's main view controller.
    ///
    /// - Returns: A `UIViewController` instance representing the main view of the module.
    static func createModule() -> UIViewController
    
    /// Navigates to the movie detail screen.
    ///
    /// - Parameters:
    ///   - parent: The parent view controller from which the navigation will occur.
    ///   - movie: The movie object containing details to be displayed.
    func navigateToMovieDetail(parent: UIViewController, movie: Movie)
}
