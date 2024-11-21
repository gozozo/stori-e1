//
//  MovieDetailPresenter.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 20/11/24.
//

class MovieDetailPresenter {
    var movie: Movie

    weak var view: MovieDetailViewProtocol?
    var interactor: MovieDetailInteractorProtocol?
    var router: MovieDetailRouterProtocol?

    init(movie: Movie) {
        self.movie = movie
    }
}

extension MovieDetailPresenter: MovieDetailPresenterProtocol {
    func viewDidLoad() {
        interactor?.fetchImage(from: movie.backdropPath, completion: { [weak self] image in
            self?.view?.displayBackdropImage(image)
        })

        interactor?.fetchImage(from: movie.posterPath, completion: { [weak self] image in
            self?.view?.displayPosterImage(image)
        })
    }

    func getTitle() -> String {
        return movie.title
    }
}
