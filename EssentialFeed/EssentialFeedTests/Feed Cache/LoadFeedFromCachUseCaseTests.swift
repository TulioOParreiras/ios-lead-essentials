//
//  LoadFeedFromCachUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Usemobile on 17/02/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import XCTest
import EssentialFeed

class LoadFeedFromCacheUseCaseTests: XCTestCase {
    
    func test_init_doesNotMessageTheStoreUponCreation() {
        let (_, store) = makeSUT()
        
        XCTAssertEqual(store.receivedMessages, [])
    }
    
    func test_load_requestCacheRetrieval() {
        let (sut, store) = makeSUT()
        
        sut.load()
        XCTAssertEqual(store.receivedMessages, [.retrieve])
    }
    
    // MARK: Helpers
    
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #file, line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }
    
}
