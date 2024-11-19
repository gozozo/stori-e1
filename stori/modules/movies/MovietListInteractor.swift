//
//  MovieListInteractor.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 18/11/24.
//

import UIKit
import CoreData

class MovieListInteractor: MovieListInteractorProtocol {
    var presenter: MovieListPresenterProtocol?
    let serviceManager = ServiceManager.shared
    
    func fetchMovies() {
        serviceManager.fetchMovies { [weak self] result in
            switch result {
            case .success(let moviesResponse):
                self?.presenter?.moviesFetched(movies: moviesResponse.results)
            case .failure(let error):
                self?.presenter?.moviesFetchFailed(error: error)
            }
        }
    }
    
    func fetchImage(from resource: String, completion: @escaping (UIImage?) -> Void) {
        serviceManager.fetchImage(resource: resource, completion: completion)
    }
}
