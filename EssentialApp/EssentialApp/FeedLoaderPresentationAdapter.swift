//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import EssentialFeed
import EssentialFeediOS
import Combine

final class FeedLoaderPresentationAdapter: FeedViewControllerDelegate {
    private let feedLoader: () -> AnyPublisher<[FeedImage], Error>
	var presenter: LoadResourcePresenter<[FeedImage], FeedViewAdapter>?
    var cancellable: AnyCancellable?
	
    init(feedLoader: @escaping () -> AnyPublisher<[FeedImage], Error>) {
		self.feedLoader = feedLoader
	}
	
	func didRequestFeedRefresh() {
		presenter?.didStartLoading()
        
        cancellable = feedLoader().sink(receiveCompletion: { [weak self] completion in
            switch completion {
            case .finished: break
            case let .failure(error):
                self?.presenter?.didFinishLoading(with: error)
            }
        }) { [weak self] feed in
            self?.presenter?.didFinishLoading(with: feed)
        }
		
	}
}
