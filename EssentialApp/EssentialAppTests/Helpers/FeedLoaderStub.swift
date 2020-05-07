//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Usemobile on 07/05/20.
//  Copyright © 2020 Essential Developer. All rights reserved.
//

import Foundation
import EssentialFeed

class FeedLoaderStub: FeedLoader {
    private let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }

    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}

