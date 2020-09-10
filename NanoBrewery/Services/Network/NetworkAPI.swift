//
//  NetworkAPI.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/10/20.
//

import Foundation
import Combine

protocol NanoBreweryNetworkeable {
    func listBeers() -> AnyPublisher<[Beer], Error>
    func showBeer(_ id: Int) -> AnyPublisher<Beer, Error>
}

class NetworkAPI: NanoBreweryNetworkeable {
    
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
    
    func showBeer(_ id: Int) -> AnyPublisher<Beer, Error> {
        run(prepareRequest("beers/\(id)"))
    }
    
    // MARK: - Helpers

    private func prepareRequest(_ route: String) -> URLRequest {
        let urlString = NetworkAPIConfiguration.baseURLString + route
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }
}


