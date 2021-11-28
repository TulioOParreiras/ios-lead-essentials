//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import Foundation

public protocol FeedView {
	func display(_ viewModel: FeedViewModel)
}

public final class FeedPresenter {
	private let feedView: FeedView
	private let loadingView: ResourceLoadingView
	private let errorView: ResourceErrorView
	
	private var loadError: String {
		return NSLocalizedString("GENERIC_CONNECTION_ERROR",
				tableName: "Shared",
				bundle: Bundle(for: Self.self),
				comment: "Error message displayed when we can't load the resource from the server")
	}
	
	public init(feedView: FeedView, loadingView: ResourceLoadingView, errorView: ResourceErrorView) {
		self.feedView = feedView
		self.loadingView = loadingView
		self.errorView = errorView
	}
	
	public static var title: String {
		return NSLocalizedString("FEED_VIEW_TITLE",
			tableName: "Feed",
			bundle: Bundle(for: FeedPresenter.self),
			comment: "Title for the feed view")
	}
	
	public func didStartLoadingFeed() {
		errorView.display(.noError)
		loadingView.display(ResourceLoadingViewModel(isLoading: true))
	}
	
	public func didFinishLoadingFeed(with feed: [FeedImage]) {
		feedView.display(FeedViewModel(feed: feed))
		loadingView.display(ResourceLoadingViewModel(isLoading: false))
	}
	
	public func didFinishLoadingFeed(with error: Error) {
		errorView.display(.error(message: loadError))
		loadingView.display(ResourceLoadingViewModel(isLoading: false))
	}
}
