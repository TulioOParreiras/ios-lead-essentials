//
//  SharedTestHelpers.swift.swift
//  EssentialAppTests
//
//  Created by Usemobile on 07/05/20.
//  Copyright © 2020 Essential Developer. All rights reserved.
//

import Foundation

func anyNSError() -> NSError {
   return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
   return URL(string: "http://any-url.com")!
}

func anyData() -> Data {
   return Data("any data".utf8)
}
