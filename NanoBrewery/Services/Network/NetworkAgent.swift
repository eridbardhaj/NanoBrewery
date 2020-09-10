//
//  NetworkAgent.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/10/20.
//

import Combine
import Foundation

struct Response<T> {
    let value: T
    let response: URLResponse
}

protocol Agent {
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder) -> AnyPublisher<Response<T>, Error>
}

class NetworkAgent: Agent {
    
    // MARK: - Properties
    // MARK: Injected
    
    private let urlSession: URLSession
    
    // MARK: - Initializers
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    // MARK: - Protocol Conformance
    // MARK: Agent
    
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
        urlSession
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try decoder.decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

