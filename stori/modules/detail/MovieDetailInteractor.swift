//
//  MovieDetailInteractor.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 20/11/24.
//

import UIKit

class MovieDetailInteractor {
    var presenter: MovieDetailPresenterProtocol?
    let serviceManager = ServiceManager.shared
}

extension MovieDetailInteractor: MovieDetailInteractorProtocol {
    func fetchFullMovieDetail(for movieId: Int) {
        serviceManager.fetchMovie(for: movieId) { [weak self] result in
            switch result {
            case .success(let movie):
                self?.presenter?.movieFetched(movie: movie)
            case .failure(let error):
                self?.presenter?.movieFetchFailed(error: error)
            }
        }
    }
    
    func fetchImage(from resource: String, completion: @escaping (UIImage?) -> Void) {
        serviceManager.fetchImage(resource: resource, completion: completion)
    }
}
