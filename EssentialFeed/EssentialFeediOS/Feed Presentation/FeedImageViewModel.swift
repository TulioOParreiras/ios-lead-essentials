//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Usemobile on 22/04/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import Foundation
import EssentialFeed

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
