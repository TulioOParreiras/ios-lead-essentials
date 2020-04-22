//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Tulio Parreiras on 02/02/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage],Error>
    
    func load(completion: @escaping (Result) -> Void)
}
