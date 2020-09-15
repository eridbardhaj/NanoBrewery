//
//  BeerListCellViewModel.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/10/20.
//

import SwiftUI
import Combine

class BeerListCellViewModel: ObservableObject {

    // MARK: - Properties
    // MARK: Immutable

    private let beer: Beer
    
    // MARK: Mutable

    private var cancellables = Set<AnyCancellable>()

    // MARK: Published

    @Published private(set) var name = ""
    @Published private(set) var percentage = ""
    @Published private(set) var firstBrewed = ""
    @Published private(set) var hashtags = [String]()
    @Published private(set) var image: UIImage?

    // MARK: - Initializers

    init(beer: Beer) {
        self.beer = beer
        
        setupInitialValues()
        setupObserving()
    }

    // MARK: - Setups

    private func setupInitialValues() {
        name = beer.name
        percentage = String(format: "%.1f", beer.percentage)
        hashtags = beer.tagline
            .components(separatedBy: ". ")
            .map { $0.lowercased() }
        firstBrewed = beer.firstBrewed
    }
    
    private func setupObserving() {
        Image.fetchImage(from: beer.imageUrlString)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
            .store(in: &cancellables)
    }
}

