//
//  MovieDetailRouter.swift
//  stori
//
//  Created by  Luis Enrique Vazquez Escobar on 20/11/24.
//

import UIKit

class MovieDetailRouter: MovieDetailRouterProtocol {
    
    static func createModule(movie: Movie) -> UIViewController {
        let view = MovieDetailViewController(nibName: "MovieDetailViewController", bundle: nil)
        
        let presenter = MovieDetailPresenter(movie: movie)
        let interactor = MovieDetailInteractor()
        let router = MovieDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

