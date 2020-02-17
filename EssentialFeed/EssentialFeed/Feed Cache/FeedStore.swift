//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Usemobile on 17/02/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import Foundation

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ items: [LocalFeedItem], timestamp: Date, completion: @escaping InsertionCompletion)
}


public struct LocalFeedItem: Equatable {
    public let id: UUID
    public let description: String?
    public let location: String?
    public let imageURL: URL
    
    public init(
        id: UUID,
        description: String?,
        location: String?,
        imageURL: URL) {
        
        self.id = id
        self.description = description
        self.location = location
        self.imageURL = imageURL
    }
    
}
