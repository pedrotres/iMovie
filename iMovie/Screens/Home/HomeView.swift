//
//  HomeView.swift
//  iMovie
//
//  Created by pedro tres on 13/04/22.
//

import UIKit

final class HomeView: UIView {
    private let homeCellViewIdentifier = "HomeCellViewIdentifier"
    
    private var movies: [Movie] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.register(MovieCellView.self, forCellReuseIdentifier: MovieCellView.cellIdentifier)
        tableView.dataSource = self
        return tableView
    }()
    
    init(){
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with movies: [Movie]){
        self.movies = movies
        self.tableView.reloadData()
    }
}
private extension HomeView {
    func setupViews(){
        self.backgroundColor = .black
        self.configureSubViews()
        self.configureTableViewConstraints()
    }
    
    func configureSubViews(){
        self.addSubview(tableView)
    }
    
    func configureTableViewConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HomeView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.movies.isEmpty {
            return 1
        }else {
            return self.movies[0].home.results.count
        }
     
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if !self.movies.isEmpty {
            
            let movie = movies[0].home.results[indexPath.row]
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCellView.cellIdentifier, for: indexPath) as? MovieCellView else {
                return .init()
            }
            let configuration = MovieCellViewConfiguration(name: movie.originalTitle, year: movie.releaseDate, star: String(format: "%f", movie.voteAverage), icon: movie.posterPath)
            cell.updateView(with: configuration)
            
            return cell
            
        }
        
        return MovieCellView()
    }
    
}

extension UITableViewCell {
    
    static var cellIdentifier: String {
        String(describing: self)
    }
}
