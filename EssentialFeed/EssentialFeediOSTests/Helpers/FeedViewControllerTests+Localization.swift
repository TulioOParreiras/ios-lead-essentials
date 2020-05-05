//
//  FeedViewControllerTests+Localization.swift
//  EssentialFeediOSTests
//
//  Created by Usemobile on 05/05/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import Foundation
import XCTest
import EssentialFeediOS

extension FeedViewControllerTests {
    func localized(_ key: String, file: StaticString = #file, line: UInt = #line) -> String {
        let table = "Feed"
        let bundle = Bundle(for: FeedViewController.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if value == key {
            XCTFail("Missing locallized string for key: \(key) in table: \(table)", file: file, line: line)
        }
        return value
    }
}
