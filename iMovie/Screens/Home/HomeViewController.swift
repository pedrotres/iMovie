//
//  HomeViewController.swift
//  iMovie
//
//  Created by pedro tres on 14/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let movieService = MovieService()
    
    private let homeView: HomeView = {
        let homeView = HomeView()
        return homeView
    }()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "iMovie App"
                
        movieService.fetchMovies{ movies in
            guard let movies = movies else {
                return
            }
            DispatchQueue.main.async {
                self.homeView.updateView(with: movies)
            }
        }
    }
    
    override func loadView() {
        self.view = homeView
    }
}
