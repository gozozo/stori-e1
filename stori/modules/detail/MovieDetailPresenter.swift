//
//  MovieDetailPresenter.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 20/11/24.
//

import UIKit

class MovieDetailPresenter {
    private var movie: Movie

    weak var view: MovieDetailViewProtocol?
    var interactor: MovieDetailInteractorProtocol?
    var router: MovieDetailRouterProtocol?

    init(movie: Movie) {
        self.movie = movie
    }
}

extension MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    func fetchFullDetail() {
        interactor?.fetchFullMovieDetail(for: movie.id)
    }

    func movieFetched(movie: Movie) {
        self.movie = movie
        view?.reloadData()
    }

    func movieFetchFailed(error: any Error) {
        view?.showError(message: error.localizedDescription)
    }

    func viewDidLoad() {
        interactor?.fetchImage(from: movie.backdropPath, completion: { [weak self] image in
            self?.view?.displayBackdropImage(image)
        })

        interactor?.fetchImage(from: movie.posterPath, completion: { [weak self] image in
            self?.view?.displayPosterImage(image)
        })
    }

    func getMovie() -> Movie {
        return movie
    }

    func back() {
        if let view: UIViewController = view as? UIViewController {
            router?.back(view: view)
        }
    }
}
