//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Mia Yu on 2024/1/31.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {

    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)

}

public final class RemoteFeedLoader {

    let url: URL
    let client: HTTPClient

    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }

    public enum Result: Equatable {

        case success([FeedItem])
        case failure(Error)

    }

    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }

    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { result in
            // note the error is "This is test",
            // but we pass .connectivity to completion

            switch result {
                case .success(let data, let response):
                    if let _ = try? JSONSerialization.jsonObject(with: data) {
                        completion(.success([]))
                    }
                    else {
                        completion(.failure(.invalidData))
                    }
                case .failure(_):
                    completion(.failure(.connectivity))
            }
        }
    }
}
