//
//  MovieListPresenter.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 18/11/24.
//

import UIKit

class MovieListPresenter {

    weak var view: MovieListViewProtocol?
    var interactor: MovieListInteractorProtocol?
    var router: MovieListRouterProtocol?

    private var currentPage = 1
    private var isLoading = false
    private var hasMorePages = true

    /// An array that holds the list of movies.
    /// This property is used to store and manage the movies displayed in the movie list.
    private var movies: [Movie] = []
}

extension MovieListPresenter: MovieListPresenterProtocol {

    func fetchMovies() {
        if !isLoading{
            isLoading = true
            interactor?.fetchMovies(page: currentPage)
        }
    }
    
    func fetchImageMovie(for resource: String, completion: @escaping (UIImage?) -> Void) {
        interactor?.fetchImage(from: resource, completion: completion)
    }
    
    func moviesFetched(moviesResponse: MoviesResponse) {
        self.movies.append(contentsOf: moviesResponse.results)
        currentPage += 1

        if currentPage > moviesResponse.totalPages {
            hasMorePages = false
        }
        view?.reloadData()
        isLoading = false
    }
    
    func moviesFetchFailed(error: any Error) {
        view?.showError(message: error.localizedDescription)
        isLoading = false
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
