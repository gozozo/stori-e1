//
//  MovieDetailProtocol.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 20/11/24.
//

import UIKit

// MARK: - Interactor Protocols
protocol MovieDetailInteractorProtocol {

    var presenter: MovieDetailPresenterProtocol? { get set }

    /// Fetches the full details of a movie for a given movie ID.
    /// - Parameter movieId: The unique identifier of the movie whose details are to be fetched.
    func fetchFullMovieDetail(for movieId: Int)

    /// Fetches an image from the specified resource URL.
    ///
    /// - Parameters:
    ///   - resource: A string representing the URL of the image resource.
    ///   - completion: A closure that is called with the fetched UIImage or nil if the image could not be fetched.
    func fetchImage(from resource: String, completion: @escaping (UIImage?) -> Void)
}

// MARK: - Presenter Protocols
protocol MovieDetailPresenterProtocol: AnyObject {

    var view: MovieDetailViewProtocol? { get set }
    var interactor: MovieDetailInteractorProtocol? { get set }
    var router: MovieDetailRouterProtocol? { get set }

    /// Fetches the full details of a movie.
    ///
    /// This function is responsible for retrieving all the detailed information
    /// about a specific movie, including but not limited to its cast, crew,
    /// synopsis, reviews, and any other relevant data.
    func fetchFullDetail()

    /// Called when a movie has been successfully fetched.
    /// - Parameter movie: The fetched `Movie` object.
    func movieFetched(movie: Movie)

    /// Called when fetching movies fails.
    /// - Parameter error: The error that occurred during the fetch operation.
    func movieFetchFailed(error: Error)

    /// Called when the view has been loaded into memory.
    /// This method is typically used to perform additional initialization
    /// and setup tasks that are required for the view.
    func viewDidLoad()

    /// Retrieves the movie details.
    /// - Returns: A `Movie` object containing the details of the movie.
    func getMovie() -> Movie

    /// Navigates back to the previous screen or view.
    func back()
}

// MARK: - View Protocols
protocol MovieDetailViewProtocol: AnyObject {
    var presenter: MovieDetailPresenterProtocol? { get set }

    /// Reloads the data for the current view or module.
    ///
    /// This method should be called to refresh the content displayed,
    /// typically after data has been updated or fetched from a remote source.
    func reloadData()

    /// Displays the backdrop image for a movie detail view.
    /// - Parameter image: The UIImage to be displayed as the backdrop.
    func displayBackdropImage(_ image: UIImage?)

    /// Displays the poster image for a movie.
    /// - Parameter image: The UIImage object representing the poster image.
    func displayPosterImage(_ image: UIImage?)
}

// MARK: - Router Protocols
protocol MovieDetailRouterProtocol {

    /// Creates and returns a new instance of the module's main view controller.
    ///
    /// - Parameter movie: The movie to be shown in the detail view.
    /// - Returns: A `UIViewController` instance representing the main view of the module.
    static func createModule(movie: Movie) -> UIViewController

    /// Navigates back to the previous screen.
    /// - Parameter view: The view controller to navigate back from.
    func back(view: UIViewController?)
}
