//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Usemobile on 05/02/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    /// The completion handler can be invoked in any thread.
    /// Clients are responsible to dispatch to appropriate threads, if needed.
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
