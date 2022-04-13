//
//  MovieService.swift
//  iMovie
//
//  Created by pedro tres on 13/04/22.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovies (_ completion: @escaping ([Movie]?) -> Void)
}

struct MovieService: MovieServiceProtocol {
    
    func fetchMovies(_ completion: @escaping ([Movie]?) -> Void) {
        let url = URL(string:"https://webservice-movies.herokuapp.com/movies")!
        self.request(url, completion: completion)
    }
    
    func request<T: Decodable>(_ url: URL, completion: @escaping (T?) -> Void){
        let dataTask = URLSession.shared.dataTask(with: url){ data, response, error in
            
            if let _ = error{
                completion(nil)
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do{
                    let repo = try decoder.decode(T.self, from: data)
                    completion(repo)
                }catch{
                    print(error)
                    completion(nil)
                }
            }
        }
        dataTask.resume()
    }
}
