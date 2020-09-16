//
//  NetworkAPIMock.swift
//  NanoBreweryTests
//
//  Created by Erid Bardhaj on 9/16/20.
//

import Foundation
import Combine
@testable import NanoBrewery

class NetworkAPIMock: BreweryAPI {

    // MARK: - Inner Types

    class CalledCount {
        var listBeers = 0
    }

    class ReturnValue {
        var listBeers = [Beer]()
    }

    // MARK: - Properties
    // MARK: Mutable

    var calledCount = CalledCount()
    var returnValue = ReturnValue()

    // MARK: - Protocol Conformance
    // MARK: BreweryAPI

    func listBeers() -> AnyPublisher<[Beer], Error> {
        calledCount.listBeers += 1
        return Just(returnValue.listBeers)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}



