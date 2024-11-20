//
//  MovieEntity.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 18/11/24.
//

struct MoviesResponse: Codable {
    let page: Int
    let results: [Movie]
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
    }
}
