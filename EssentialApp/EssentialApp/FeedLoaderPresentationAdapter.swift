//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import EssentialFeed
import EssentialFeediOS
import Combine

final class FeedLoaderPresentationAdapter: FeedViewControllerDelegate {
    private let feedLoader: () -> FeedLoader.Publisher
	var presenter: FeedPresenter?
    var cancellable: AnyCancellable?
	
    init(feedLoader: @escaping () -> FeedLoader.Publisher) {
		self.feedLoader = feedLoader
	}
	
	func didRequestFeedRefresh() {
		presenter?.didStartLoadingFeed()
        
        cancellable = feedLoader().sink(receiveCompletion: { [weak self] completion in
            switch completion {
            case .finished: break
            case let .failure(error):
                self?.presenter?.didFinishLoadingFeed(with: error)
            }
        }) { [weak self] feed in
            self?.presenter?.didFinishLoadingFeed(with: feed)
        }
		
	}
}
