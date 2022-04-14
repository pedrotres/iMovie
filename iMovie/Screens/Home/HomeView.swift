//
//  HomeView.swift
//  iMovie
//
//  Created by pedro tres on 13/04/22.
//

import UIKit

final class HomeView: UIView {
    private let homeCellViewIdentifier = "HomeCellViewIdentifier"
    
    private var movies: Movie = Movie.init(home: Home(results: []))
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.register(MovieCellView.self, forCellReuseIdentifier: MovieCellView.cellIdentifier)
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var loadingView: LoadingView = {
        let loadingView = LoadingView()
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.setLoadingMessage("Loading movies")
        loadingView.isHidden = true
        return loadingView
    }()
    
    init(){
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with movies: Movie){
        self.movies = movies
        self.tableView.reloadData()
    }
    
    func updateLoading(with isLoading: Bool){
        loadingView.updateLoading(isLoading)
    }
}
private extension HomeView {
    func setupViews(){
        self.backgroundColor = .black
        self.configureSubViews()
        self.configureTableViewConstraints()
        self.configureLoadingViewConstraints()
    }
    
    func configureSubViews(){
        self.addSubview(tableView)
        self.addSubview(loadingView)
    }
    
    func configureTableViewConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureLoadingViewConstraints() {
        NSLayoutConstraint.activate([
            self.loadingView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.loadingView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.loadingView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.loadingView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension HomeView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.home.results.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies.home.results[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCellView.cellIdentifier, for: indexPath) as? MovieCellView else {
            return .init()
        }
        let configuration = MovieCellViewConfiguration(name: movie.originalTitle, year: movie.releaseDate, star: String(format: "%.1f", movie.voteAverage), icon: movie.posterPath)
        cell.updateView(with: configuration)
        
        return cell
    }
    
}

extension UITableViewCell {
    
    static var cellIdentifier: String {
        String(describing: self)
    }
}
