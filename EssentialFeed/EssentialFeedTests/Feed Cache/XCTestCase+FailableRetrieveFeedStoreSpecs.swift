//
//  XCTestCase+FailableRetrieveFeedStoreSpecs.swift
//  EssentialFeedTests
//
//  Created by Usemobile on 11/03/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import XCTest
import EssentialFeed

extension FailableRetrieveFeedStoreSpecs where Self: XCTestCase {
   func assertThatRetrieveDeliversFailureOnRetrievalError(on sut: FeedStore, file: StaticString = #file, line: UInt = #line) {
       expect(sut, toRetrieve: .failure(anyNSError()), file: file, line: line)
   }

   func assertThatRetrieveHasNoSideEffectsOnFailure(on sut: FeedStore, file: StaticString = #file, line: UInt = #line) {
       expect(sut, toRetrieveTwice: .failure(anyNSError()), file: file, line: line)
   }
}
