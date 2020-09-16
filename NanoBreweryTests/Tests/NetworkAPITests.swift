//
//  NetworkAPITests.swift
//  NanoBreweryTests
//
//  Created by Erid Bardhaj on 9/16/20.
//

import XCTest
import Combine
@testable import NanoBrewery

class NetworkAPITests: XCTestCase {

    // MARK: - Properties
    // MARK: Mutable

    var api: NetworkAPI!
    var agentMock: NetworkAgentMock!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        setupMocks()
    }

    // MARK: - Setups

    private func setupMocks() {
        agentMock = NetworkAgentMock()

        api = NetworkAPI(agent: agentMock)
    }

    // MARK: - Tests
    // MARK: Run

    func testRun_agentRunCalled() {
        let dummyRequest = URLRequest(url: "www.example.com".requiredURL)
        let _: AnyPublisher<Beer, Error> = api.run(dummyRequest)

        XCTAssertEqual(self.agentMock.calledCount.run, 1)
    }

    // MARK: listBeers

    func testListBeers_correctURLIsReturned() {
        _ = api.listBeers()

        let expectedURLString = "https://api.punkapi.com/v2/beers"

        XCTAssertEqual(self.agentMock.parameter.urlRequest?.url?.absoluteString, expectedURLString)
    }
}


