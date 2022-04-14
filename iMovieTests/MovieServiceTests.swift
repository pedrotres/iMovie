//
//  MovieService.swift
//  iMovieTests
//
//  Created by pedro tres on 14/04/22.
//

import XCTest
@testable import iMovie

class MovieServiceTests: XCTestCase {
    var sut: MovieServiceMock!
    
    override func setUp() {
        sut = MovieServiceMock()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_fetchMovies_withData_shouldWithSucess() {
        sut.errorAPI = nil
        var resultExpected: Movie?
        
        sut.fetchMovies{ homeData in
            
            guard let result = homeData else {
                return
            }
            resultExpected = result
        }
        
        XCTAssertNotNil(resultExpected)
        XCTAssertEqual(resultExpected?.home.results[0].originalTitle, "Spider-Man: No Way Home")
    }
}


