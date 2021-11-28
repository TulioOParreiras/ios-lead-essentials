//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeed

class FeedPresenterTests: XCTestCase {

	func test_title_isLocalized() {
		XCTAssertEqual(FeedPresenter.title, localized("FEED_VIEW_TITLE"))
	}
    
    func test_map_createsViewModels() {
        let feed = uniqueImageFeed().models
        
        let viewModels = FeedPresenter.map(feed)
        
        XCTAssertEqual(viewModels.feed, feed)
    }
	
	// MARK: - Helpers

    private func localized(_ key: String, table: String = "Feed", file: StaticString = #file, line: UInt = #line) -> String {
		let bundle = Bundle(for: FeedPresenter.self)
		let value = bundle.localizedString(forKey: key, value: nil, table: table)
		if value == key {
			XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
		}
		return value
	}
    
}
