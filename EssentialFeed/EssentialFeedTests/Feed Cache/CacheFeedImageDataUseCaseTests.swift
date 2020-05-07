//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeed

class CacheFeedImageDataUseCaseTests: XCTestCase {
	
	func test_init_doesNotMessageStoreUponCreation() {
		let (_, store) = makeSUT()
		
		XCTAssertTrue(store.receivedMessages.isEmpty)
	}
	
	func test_saveImageDataForURL_requestsImageDataInsertionForURL() {
		let (sut, store) = makeSUT()
		let url = anyURL()
		let data = anyData()
		
		sut.save(data, for: url) { _ in }
		
		XCTAssertEqual(store.receivedMessages, [.insert(data: data, for: url)])
	}
	
	func test_saveImageDataFromURL_failsOnStoreInsertionError() {
		let (sut, store) = makeSUT()
		
		expect(sut, toCompleteWith: failed(), when: {
			let insertionError = anyNSError()
			store.completeInsertion(with: insertionError)
		})
	}
	
	func test_saveImageDataFromURL_succeedsOnSuccessfulStoreInsertion() {
		let (sut, store) = makeSUT()
		
		expect(sut, toCompleteWith: .success(()), when: {
			store.completeInsertionSuccessfully()
		})
	}
	
	func test_saveImageDataFromURL_doesNotDeliverResultAfterSUTInstanceHasBeenDeallocated() {
		let store = FeedImageDataStoreSpy()
		var sut: LocalFeedImageDataLoader? = LocalFeedImageDataLoader(store: store)
		
		var received = [LocalFeedImageDataLoader.SaveResult]()
		sut?.save(anyData(), for: anyURL()) { received.append($0) }
		
		sut = nil
		store.completeInsertionSuccessfully()

		XCTAssertTrue(received.isEmpty, "Expected no received results after instance has been deallocated")
	}
	
	// MARK: - Helpers
	
	private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: LocalFeedImageDataLoader, store: FeedImageDataStoreSpy) {
		let store = FeedImageDataStoreSpy()
		let sut = LocalFeedImageDataLoader(store: store)
		trackForMemoryLeaks(store, file: file, line: line)
		trackForMemoryLeaks(sut, file: file, line: line)
		return (sut, store)
	}
	
	private func failed() -> LocalFeedImageDataLoader.SaveResult {
		return .failure(LocalFeedImageDataLoader.SaveError.failed)
	}

	private func expect(_ sut: LocalFeedImageDataLoader, toCompleteWith expectedResult: LocalFeedImageDataLoader.SaveResult, when action: () -> Void, file: StaticString = #file, line: UInt = #line) {
		let exp = expectation(description: "Wait for load completion")
		
		sut.save(anyData(), for: anyURL()) { receivedResult in
			switch (receivedResult, expectedResult) {
			case (.success, .success):
				break
				
			case (.failure(let receivedError as LocalFeedImageDataLoader.SaveError),
				  .failure(let expectedError as LocalFeedImageDataLoader.SaveError)):
				XCTAssertEqual(receivedError, expectedError, file: file, line: line)
				
			default:
				XCTFail("Expected result \(expectedResult), got \(receivedResult) instead", file: file, line: line)
			}
			
			exp.fulfill()
		}
		
		action()
		wait(for: [exp], timeout: 1.0)
	}
	
}
