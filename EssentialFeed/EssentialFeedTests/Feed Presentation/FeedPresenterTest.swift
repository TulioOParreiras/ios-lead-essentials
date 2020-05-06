//
//  FeedPresenterTest.swift
//  EssentialFeedTests
//
//  Created by Usemobile on 06/05/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import XCTest

final class FeedPresenter {
    init(view: Any) {
        
    }
}

class FeedPresenterTest: XCTestCase {

    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()
        
        _ = FeedPresenter(view: view)
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    // MARK: - Helpers
    
    private class ViewSpy {
        let messages = [Any]()
    }

}
