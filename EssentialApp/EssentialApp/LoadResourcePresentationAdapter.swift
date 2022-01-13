//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import EssentialFeed
import EssentialFeediOS
import Combine

final class LoadResourcePresentationAdapter<Resource, View: ResourceView> {
    private let loader: () -> AnyPublisher<Resource, Error>
	var presenter: LoadResourcePresenter<Resource, View>?
    var cancellable: AnyCancellable?
	
    init(loader: @escaping () -> AnyPublisher<Resource, Error>) {
		self.loader = loader
	}
	
	func loadResource() {
		presenter?.didStartLoading()
        
        cancellable = loader()
            .dispatchOnMainThread()
            .sink(receiveCompletion: { [weak self] completion in
            switch completion {
            case .finished: break
            case let .failure(error):
                self?.presenter?.didFinishLoading(with: error)
            }
        }) { [weak self] resource in
            self?.presenter?.didFinishLoading(with: resource)
        }
		
	}
}

extension LoadResourcePresentationAdapter: FeedImageCellControllerDelegate {
    func didRequestImage() {
        loadResource()
    }
    
    func didCancelImageRequest() {
        cancellable?.cancel()
        cancellable = nil
    }
}
