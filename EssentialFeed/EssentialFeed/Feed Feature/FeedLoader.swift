//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Tulio Parreiras on 02/02/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
