//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Usemobile on 07/05/20.
//  Copyright © 2020 Essential Developer. All rights reserved.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
