//
//  BeerListViewModelTests.swift
//  NanoBreweryTests
//
//  Created by Erid Bardhaj on 9/16/20.
//

import XCTest
import Combine
@testable import NanoBrewery

class BeerListViewModelTests: XCTestCase {

    // MARK: - Properties
    // MARK: Mutable

    var viewModel: BeerListViewModel!
    var networkAPIMock: NetworkAPIMock!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        setupMocks()
    }

    // MARK: - Setups

    private func setupMocks(with beerList: [Beer] = [Beer]()) {
        networkAPIMock = NetworkAPIMock()
        networkAPIMock.returnValue.listBeers = beerList

        viewModel = BeerListViewModel(networkAPI: networkAPIMock)
    }

    // MARK: - Tests
    // MARK: setupObserving

    func testSetupObserving_listBeersIsCalled() {
        XCTAssertEqual(self.networkAPIMock.calledCount.listBeers, 1)
    }

    // MARK: listBeers

    func testListBeers_beerListIsUpdated() {
        let exp = expectation(description: "Waiting for BeerList")
        let beerList = [StubHelper.beer]
        setupMocks(with: beerList)

        let result = XCTWaiter.wait(for: [exp], timeout: 0.1)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(viewModel.beerList, beerList)
        } else {
            XCTFail("Delay interrupted")
        }
    }

    // MARK: Published

    func testTitleText_valueMatches() {
        XCTAssertEqual(viewModel.titleText, "Beer List")
    }

    func testLoadingText_valueMatches() {
        XCTAssertEqual(viewModel.loadingText, "Loading Beers")
    }
}


