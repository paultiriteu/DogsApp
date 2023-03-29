//
//  APIService.swift
//  DogsApp
//
//  Created by Paul-Ioan-George TIRITEU on 24.03.2023.
//

import Foundation
import Combine

protocol Service {
    func dataTaskPublisher<T: Decodable>(for url: URL, httpMethod: String) -> AnyPublisher<T, NetworkError>
}

class APIService: Service {
    private let session = URLSession(configuration: .default)
    
    func dataTaskPublisher<T>(for url: URL, httpMethod: HTTPMethod) -> AnyPublisher<T, NetworkError> where T : Decodable {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        return session.dataTaskPublisher(for: request)
            .tryMap { (data, response) in
                if let httpURLResponse = response as? HTTPURLResponse {
                    if !(200...299 ~= httpURLResponse.statusCode) {
                        throw NetworkError(statusCode: httpURLResponse.statusCode)
                    }
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                return NetworkError(statusCode: 404)
            }
            .eraseToAnyPublisher()
    }
}

struct NetworkError: Error {
    let statusCode: Int
}

typealias HTTPMethod = String

extension HTTPMethod {
    static let get = "GET"
    static let post = "POST"
}

struct DataResponse<Response: Decodable>: Decodable {
    let data: Response
}
