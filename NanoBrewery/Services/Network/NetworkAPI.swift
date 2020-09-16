//
//  NetworkAPI.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/10/20.
//

import Foundation
import Combine

protocol BreweryAPI {
    func listBeers() -> AnyPublisher<[Beer], Error>
}

class NetworkAPI: BreweryAPI {
    
    // MARK: - Properties
    // MARK: Injected
    
    let agent: Agent
    
    // MARK: - Initializers
    
    init(agent: Agent = NetworkAgent()) {
        self.agent = agent
    }
    
    // MARK: - Actions
    
    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        agent.run(request, JSONDecoder())
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    // MARK: - Protocol Conformance
    // MARK: NanoBreweryNetworkeable
    
    func listBeers() -> AnyPublisher<[Beer], Error> {
        run(prepareRequest("beers"))
    }
    
    // MARK: - Helpers

    private func prepareRequest(_ route: String) -> URLRequest {
        let urlString = NetworkAPIConfiguration.baseURLString + route
        return URLRequest(url: urlString.requiredURL)
    }
}


