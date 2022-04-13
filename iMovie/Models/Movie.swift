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
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int
}

struct Result: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
