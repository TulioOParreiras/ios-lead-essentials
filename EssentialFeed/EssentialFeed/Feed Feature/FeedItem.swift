//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Tulio Parreiras on 02/02/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import Foundation

public struct FeedItem: Equatable {
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
