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
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
