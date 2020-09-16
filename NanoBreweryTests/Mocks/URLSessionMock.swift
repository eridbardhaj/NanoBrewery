//
//  URLSessionMock.swift
//  NanoBreweryTests
//
//  Created by Erid Bardhaj on 9/16/20.
//

import Foundation
@testable import NanoBrewery

class URLSessionMock: URLSessionable {

    // MARK: - Inner Types

    class CalledCount {
        var dataTaskPublisher = 0
    }

    class ReturnValue {
        var dataTaskPublisher = URLSession.DataTaskPublisher(
            request: URLRequest(url: "www.example.com".requiredURL),
            session: URLSession(configuration: .default)
        )
    }

    // MARK: - Properties
    // MARK: Immutable

    let calledCount: CalledCount
    let returnValue: ReturnValue

    // MARK: - Initializers

    init(calledCount: CalledCount = CalledCount(),
         returnValue: ReturnValue = ReturnValue()) {
        self.calledCount = calledCount
        self.returnValue = returnValue
    }

    // MARK: - Protocol Conformance
    // MARK: URLSessionable

    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher {
        calledCount.dataTaskPublisher += 1
        return returnValue.dataTaskPublisher
    }
}

