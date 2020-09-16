//
//  NetworkAgentTests.swift
//  NanoBreweryTests
//
//  Created by Erid Bardhaj on 9/16/20.
//

import XCTest
import Combine
@testable import NanoBrewery

class NetworkAgentTests: XCTestCase {

    // MARK: - Properties
    // MARK: Mutable

    var agent: NetworkAgent!
    var urlSessionMock: URLSessionMock!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        setupMocks()
    }

    // MARK: - Setups

    private func setupMocks() {
        urlSessionMock = URLSessionMock()

        agent = NetworkAgent(urlSession: urlSessionMock)
    }

    // MARK: - Tests
    // MARK: run

    func testRun_dataTaskPublisherCalled() {
        let dummyRequest = URLRequest(url: "www.example.com".requiredURL)
        let _: AnyPublisher<Response<Beer>, Error> = agent.run(dummyRequest)

        XCTAssertEqual(self.urlSessionMock.calledCount.dataTaskPublisher, 1)
    }
}

