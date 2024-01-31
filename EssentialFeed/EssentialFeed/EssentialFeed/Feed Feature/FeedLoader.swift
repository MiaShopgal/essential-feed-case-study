//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Mia Yu on 2024/1/31.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
