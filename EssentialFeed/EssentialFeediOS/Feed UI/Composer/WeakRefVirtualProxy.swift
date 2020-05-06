//
//  WeakRefVirtualProxy.swift
//  EssentialFeediOS
//
//  Created by Usemobile on 05/05/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import UIKit
import EssentialFeed

final class WeakRefVirtualProxy<T: AnyObject> {
    private weak var object: T?
    
    init(_ object: T) {
        self.object = object
    }
}

extension WeakRefVirtualProxy: FeedLoadingView where T: FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel) {
        object?.display(viewModel)
    }
}

extension WeakRefVirtualProxy: FeedImageView where T: FeedImageView, T.Image == UIImage {
    func display(_ model: FeedImageViewModel<UIImage>) {
        object?.display(model)
    }
}

extension WeakRefVirtualProxy: FeedErrorView where T: FeedErrorView {
   func display(_ viewModel: FeedErrorViewModel) {
       object?.display(viewModel)
   }
}
