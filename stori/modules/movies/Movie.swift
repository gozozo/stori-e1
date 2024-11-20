//
//  MovieEntity.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 18/11/24.
//

// Root structure for the response
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

// Structure for a single movie
struct Movie: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIDs: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDs = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
