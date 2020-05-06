//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Usemobile on 06/05/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import Foundation

public struct FeedErrorViewModel {
    public let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
