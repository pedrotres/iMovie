//
//  MovieService.swift
//  iMovie
//
//  Created by pedro tres on 13/04/22.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovies (_ completion: @escaping (Movie?) -> Void)
}

struct MovieService: MovieServiceProtocol {
    func fetchMovies(_ completion: @escaping (Movie?) -> Void) {
        
        let url = URL(string: "https://webservice-movies.herokuapp.com/movies")!
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode(Movie.self, from: data)
                completion(movies)
            } catch {
                print("error \(error.localizedDescription)")
                completion(nil)
            }
        }
        dataTask.resume()
    }
}
