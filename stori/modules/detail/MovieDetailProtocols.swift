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

    /// Called when the view has been loaded into memory.
    /// This method is typically used to perform additional initialization
    /// and setup tasks that are required for the view.
    func viewDidLoad()

    /// Retrieves the title of the movie.
    /// - Returns: A `String` representing the title of the movie.
    func getTitle() -> String
}

// MARK: - View Protocols
protocol MovieDetailViewProtocol: AnyObject {
    var presenter: MovieDetailPresenterProtocol? { get set }

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
}
