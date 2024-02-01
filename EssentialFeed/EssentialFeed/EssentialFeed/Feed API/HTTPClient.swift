//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Mia Yu on 2024/2/1.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {

    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)

}
