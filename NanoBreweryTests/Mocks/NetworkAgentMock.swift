//
//  NetworkAgentMock.swift
//  NanoBreweryTests
//
//  Created by Erid Bardhaj on 9/16/20.
//

import Foundation
import Combine
@testable import NanoBrewery

class NetworkAgentMock: Agent {

    // MARK: - Inner Types

    class CalledCount {
        var run = 0
    }

    class ReturnValue {
        func run<T>() -> AnyPublisher<Response<T>, Error> {
            Just("")
                .compactMap { $0 as? T }
                .compactMap { Response<T>(value: $0, response: URLResponse()) }
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }

    class Parameter {
        var urlRequest: URLRequest?
    }

    // MARK: - Properties
    // MARK: Mutable

    var calledCount = CalledCount()
    var returnValue = ReturnValue()
    var parameter = Parameter()

    // MARK: - Protocol Conformance
    // MARK: URLSessionable

    func run<T>(_ request: URLRequest, _ decoder: JSONDecoder) -> AnyPublisher<Response<T>, Error> where T: Decodable {

        parameter.urlRequest = request
        calledCount.run += 1
        return returnValue.run()
    }
}


