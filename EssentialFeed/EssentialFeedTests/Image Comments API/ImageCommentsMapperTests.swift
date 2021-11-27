//
//  LoadImageCommensFromRemoteUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Tulio de Oliveira Parreiras on 27/11/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeed

final class ImageCommentsMapperTests: XCTestCase {
    
    func test_map_throwsErrorOnNon2xxHTTPResponse() throws {
        let samples = [150, 199, 300, 400, 500]
        
        try samples.enumerated().forEach { index, code in
            let json = makeItemsJSON([])
            XCTAssertThrowsError(
                try ImageCommentsMapper.map(json, from: HTTPURLResponse(statusCode: code))
            )
        }
    }
    
    func test_map_throwsErrorOn2xxHTTPResponseWithInvalidJSON() throws {
        let samples = [200, 201, 250, 280, 299]
        
        try samples.enumerated().forEach { index, code in
            let invalidJSON = Data("invalid json".utf8)
            XCTAssertThrowsError(
                try ImageCommentsMapper.map(invalidJSON, from: HTTPURLResponse(statusCode: code))
            )
        }
    }
    
    func test_map_throwsNoItemsOn2xxHTTPResponseWithEmptyJSONList() throws {
        let samples = [200, 201, 250, 280, 299]
        let emptyListJSON = makeItemsJSON([])
        
        try samples.enumerated().forEach { index, code in
            let result = try ImageCommentsMapper.map(emptyListJSON, from: HTTPURLResponse(statusCode: code))
            XCTAssertTrue(result.isEmpty)
        }
    }
    
    func test_map_throwsItemsOn2xxHTTPResponseWithJSONItems() throws {
        let item1 = makeItem(
            id: UUID(),
            message: "a message",
            createdAt: (date: Date(timeIntervalSince1970: 1598627222), iso8601String: "2020-08-28T15:07:02+00:00"),
            username: "a username")
        
        let item2 = makeItem(
            id: UUID(),
            message: "another message",
            createdAt: (date: Date(timeIntervalSince1970: 1577881882), iso8601String: "2020-01-01T12:31:22+00:00"),
            username: "another username")
        
        let samples = [200, 201, 250, 280, 299]
        let json = makeItemsJSON([item1.json, item2.json])
        
        try samples.enumerated().forEach { index, code in
            let result = try ImageCommentsMapper.map(json, from: HTTPURLResponse(statusCode: code))
            XCTAssertEqual([item1.model, item2.model], result)
        }
    }
    
    // MARK: - Helpers
        
    private func makeItem(id: UUID, message: String, createdAt: (date: Date, iso8601String: String), username: String) -> (model: ImageComment, json: [String: Any]) {
        let item = ImageComment(id: id, message: message, createdAt: createdAt.date, username: username)
        
        let json: [String: Any] = [
            "id": id.uuidString,
            "message": message,
            "created_at": createdAt.iso8601String,
            "author": [
                "username": username
            ]
        ]
        
        return (item, json)
    }

}
