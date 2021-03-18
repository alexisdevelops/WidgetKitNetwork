//
//  NetworkClient.swift
//  Shared
//
//  Created by alexis on 16/03/21.
//

import Foundation

public final class NetworkClient {
    private let session: URLSession = .shared

    enum NetworkError: Error {
        case noData
    }

    public init() { }

    func executeRequest(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
