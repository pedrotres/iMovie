//
//  MovieCellView.swift
//  iMovieTests
//
//  Created by pedro tres on 13/04/22.
//

import XCTest
import SnapshotTesting
@testable import iMovie

class MovieCellViewSnapshotTests: XCTestCase {

   let size = CGSize(width: 400, height: 150)
   let isRecod = true
    
    func test_movieCellView_whenSnapshot_shouldSuccess () {
        let configuration = MovieCellViewConfiguration(name: "Spider-Man: No Way Home", year: "2022", star: "8.7", icon: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg")
        
        let movieCellView = MovieCellView(style: .default, reuseIdentifier: nil)
        movieCellView.backgroundColor = .black
        movieCellView.updateView(with: configuration)
        
        assertSnapshot(matching: movieCellView, as: .image(size: size), record: isRecod)
    }
    
    func test_movieCellView_whenSnapshot_noName () {
        let configuration = MovieCellViewConfiguration(name: "", year: "2022", star: "8.7", icon: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg")
        
        let movieCellView = MovieCellView(style: .default, reuseIdentifier: nil)
        movieCellView.backgroundColor = .black
        movieCellView.updateView(with: configuration)
        
        assertSnapshot(matching: movieCellView, as: .image(size: size), record: isRecod)
    }
    
    func test_movieCellView_whenSnapshot_noYear () {
        let configuration = MovieCellViewConfiguration(name: "Spider-Man: No Way Home", year: "", star: "8.7", icon: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg")
        
        let movieCellView = MovieCellView(style: .default, reuseIdentifier: nil)
        movieCellView.backgroundColor = .black
        movieCellView.updateView(with: configuration)
        
        assertSnapshot(matching: movieCellView, as: .image(size: size), record: isRecod)
    }
    
    func test_movieCellView_whenSnapshot_noStar () {
        let configuration = MovieCellViewConfiguration(name: "Spider-Man: No Way Home", year: "2022", star: "", icon: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg")
        
        let movieCellView = MovieCellView(style: .default, reuseIdentifier: nil)
        movieCellView.backgroundColor = .black
        movieCellView.updateView(with: configuration)
        
        assertSnapshot(matching: movieCellView, as: .image(size: size), record: isRecod)
    }
    
    func test_movieCellView_whenSnapshot_noIcon () {
        let configuration = MovieCellViewConfiguration(name: "Spider-Man: No Way Home", year: "2022", star: "8.7", icon: "")
        
        let movieCellView = MovieCellView(style: .default, reuseIdentifier: nil)
        movieCellView.backgroundColor = .black
        movieCellView.updateView(with: configuration)
        
        assertSnapshot(matching: movieCellView, as: .image(size: size), record: isRecod)
    }
}
