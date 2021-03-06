//
//  LoadingViewTests.swift
//  iMovieTests
//
//  Created by pedro tres on 14/04/22.
//

import XCTest
import SnapshotTesting
@testable import iMovie

class LoadingViewTests: XCTestCase {
    
    let size = CGSize(width: 300, height: 600)
    let isRecord = false
    let loadingView = LoadingView(shouldAnimate: false)
    
    func test_loadingView_whenSnapshot_shouldSuccess () {
        
        assertSnapshot(matching: loadingView, as: .image(size: size), record: isRecord)
    }
    
    func test_loadingView_whenChangeMessage_shouldSuccess(){
        loadingView.setLoadingMessage("Loading movies...")
        
        assertSnapshot(matching: loadingView, as: .image(size: size), record: isRecord)
    }
}
