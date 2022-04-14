//
//  Movie.swift
//  iMovie
//
//  Created by pedro tres on 13/04/22.
//

import Foundation

struct Movie: Codable {
    let home: Home
}

struct Home: Codable {
    let results: [Result]
}

struct Result: Codable {
    let backdropPath: String
    let originalLanguage, originalTitle, overview: String
    let posterPath, releaseDate, title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}
