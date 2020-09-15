//
//  BeerListViewModel.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/10/20.
//

import Foundation
import Combine

class BeerListViewModel: ObservableObject {

    // MARK: - Properties
    // MARK: Immutable

    private let networkAPI: BreweryAPI

    // MARK: Mutable

    private var cancellables = Set<AnyCancellable>()

    // MARK: Published

    @Published private(set) var isLoading: Bool = false
    @Published private(set) var beerList = [Beer]()
    @Published private(set) var titleText = "Beer List"
    @Published private(set) var loadingText = "Loading Beers"

    // MARK: - Initializers

    init(networkAPI: BreweryAPI = ServiceFactory.networkAPI) {
        self.networkAPI = networkAPI
        setupObserving()
    }

    // MARK: - Setups

    private func setupObserving() {
        networkAPI.listBeers()
            .receive(on: DispatchQueue.main)
            .handleEvents(
                receiveSubscription: { [weak self] _ in self?.isLoading = true },
                receiveOutput: { [weak self] _ in self?.isLoading = false },
                receiveCompletion: { [weak self] _ in self?.isLoading = false },
                receiveCancel: { [weak self] in self?.isLoading = false },
                receiveRequest: { _ in }
            )
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        print(error)
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] in self?.handleBeerList($0) }
            )
            .store(in: &cancellables)
    }

    // MARK: - Helpers
    // MARK: Handlers

    private func handleBeerList(_ beerList: [Beer]) {
        self.beerList = beerList
    }
}
