//
//  ImageCommentsPresenterTests.swift
//  
//
//  Created by Tulio de Oliveira Parreiras on 28/11/21.
//

import XCTest
import EssentialFeed

class ImageCommentsPresenterTests: XCTestCase {
    
    func test_title_isLocalized() {
        XCTAssertEqual(ImageCommentsPresenter.title, localized("IMAGE_COMMENTS_VIEW_TITLE"))
    }
    
}
