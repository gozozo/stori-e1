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
    func fetchImage(from resource: String, completion: @escaping (UIImage?) -> Void) {
        serviceManager.fetchImage(resource: resource, completion: completion)
    }
}
