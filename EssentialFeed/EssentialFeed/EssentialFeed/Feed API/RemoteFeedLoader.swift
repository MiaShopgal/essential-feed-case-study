//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Mia Yu on 2024/1/31.
//

import Foundation

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

            switch result {
                case let .success(data, response):
//                    completion(self.map(data, from: response))
                    do {
                        let items = try FeedItemMapper.map(data, response)
                        completion(.success(items))
                    }
                    catch {
                        completion(.failure(.invalidData))
                    }
                case .failure(_):
                    completion(.failure(.connectivity))
            }
        }
    }
}
