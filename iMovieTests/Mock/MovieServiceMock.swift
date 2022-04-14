//
//  MovieServiceMock.swift
//  iMovieTests
//
//  Created by pedro tres on 14/04/22.
//

import Foundation
@testable import iMovie

enum APIError: Error{
    case noData
    case parseError
}

class MovieServiceMock: MovieServiceProtocol {
    var errorAPI: APIError? = nil
    
    func fetchMovies(_ completion: @escaping (Movie?) -> Void) {
        switch errorAPI {
        case .parseError:
            completion(nil)
        case .noData:
            completion(nil)
        default:
            if let result = parseJSONMock() {
                completion(result)
            } else {
                completion(nil)
            }
        }
    }
    
    private func parseJSONMock() -> Movie? {
        guard let path = Bundle.main.path(forResource: "movie_data", ofType: "json") else { return nil }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            let movies = try decoder.decode(Movie.self, from: data)
            return movies
        } catch  {
            print("error decoder \(error)")
            print("teste")
            return nil
        }
    }
}
