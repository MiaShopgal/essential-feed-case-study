//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Mia Yu on 2024/1/31.
//

import Foundation

public protocol HTTPClient {

    func get(from url: URL, completion: @escaping (Error?, HTTPURLResponse?) -> Void)

}

public final class RemoteFeedLoader {

    let url: URL
    let client: HTTPClient

    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }

    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }

    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { error, response in
            // note the error is "This is test",
            // but we pass .connectivity to completion
            if response != nil {
                completion(.invalidData)
            }
            else {
                completion(.connectivity)
            }
        }
    }
}
