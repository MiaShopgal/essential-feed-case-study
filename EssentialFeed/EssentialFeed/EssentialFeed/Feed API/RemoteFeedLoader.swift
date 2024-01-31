//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Mia Yu on 2024/1/31.
//

import Foundation

public protocol HTTPClient {
    
    func get(from url: URL)
    
}

public final class RemoteFeedLoader {

    let url: URL
    let client: HTTPClient
    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }

    public func load() {
        client.get(from: url)
    }
}

