//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by Usemobile on 09/03/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import Foundation

final class FeedCachePolicy {
    private init() { }
    
    private static let calendar = Calendar(identifier: .gregorian)
    
    private static var maxCacheAgeInDays: Int {
        return 7
    }
    
    static func validate(_ timestamp: Date, against date: Date) -> Bool {
        guard let maxCacheAge = calendar.date(byAdding: .day, value: maxCacheAgeInDays, to: timestamp) else {
            return false
        }
        return date < maxCacheAge
    }
    
}
