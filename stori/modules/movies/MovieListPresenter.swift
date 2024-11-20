//
//  MovieListPresenter.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 18/11/24.
//

import UIKit

class MovieListPresenter: MovieListPresenterProtocol {
    
    weak var view: MovieListViewProtocol?
    var interactor: MovieListInteractorProtocol?
    var router: MovieListRouterProtocol?
    
    /// An array that holds the list of movies.
    /// This property is used to store and manage the movies displayed in the movie list.
    private var movies: [Movie] = []
    
    func fetchMovies() {
        interactor?.fetchMovies()
    }
    
    func fetchImageMovie(for resource: String, completion: @escaping (UIImage?) -> Void) {
        interactor?.fetchImage(from: resource, completion: completion)
    }
    
    func moviesFetched(movies: [Movie]) {
        self.movies = movies
        view?.reloadData()
    }
    
    func moviesFetchFailed(error: any Error) {
        view?.showError(message: error.localizedDescription)
    }
    
    func numberOfMovies() -> Int {
        return movies.count
    }
    
    func movie(at index: Int) -> Movie {
        return movies[index]
    }
    
    func navigateToMovieDetail(at index: Int) {
        guard let view = view as? UIViewController else { return }
        let movie = movies[index]
        router?.navigateToMovieDetail(parent: view, movie: movie)
    }
}
