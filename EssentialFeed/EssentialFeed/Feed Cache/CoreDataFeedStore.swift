//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Usemobile on 13/03/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import Foundation
import CoreData

public final class CoreDataFeedStore: FeedStore {
    public init() { }
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }
    
    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        
    }
    
}


private class ManagedCache: NSManagedObject {
   @NSManaged var timestamp: Date
   @NSManaged var feed: NSOrderedSet
}

private class ManagedFeedImage: NSManagedObject {
   @NSManaged var id: UUID
   @NSManaged var imageDescription: String?
   @NSManaged var location: String?
   @NSManaged var url: URL
   @NSManaged var cache: ManagedCache
}
