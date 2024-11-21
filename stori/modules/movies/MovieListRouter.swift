//
//  MovieListRouter.swift
//  stori
//
//  Created by  Luis Enrique Vazquez Escobar on 18/11/24.
//

import UIKit

class MovieListRouter: MovieListRouterProtocol {

    static func createModule() -> UIViewController {
        let view = MovieListViewController(nibName: "MovieListViewController", bundle: nil)

        let presenter = MovieListPresenter()
        let interactor = MovieListInteractor()
        let router = MovieListRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        return view
    }

    func navigateToMovieDetail(parent: UIViewController, movie: Movie) {
        let navController = parent.navigationController
        let movieDetailViewController = MovieDetailRouter.createModule(movie: movie)
        navController?.pushViewController(movieDetailViewController, animated: true)
    }
}

