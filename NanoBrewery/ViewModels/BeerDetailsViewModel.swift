//
//  BeerDetailsViewModel.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/14/20.
//

import SwiftUI
import Combine

class BeerDetailsViewModel: ObservableObject {
    
    // MARK: - Inner Types
    
    struct LeftEntry {
        let imageName: String
        let text: String
        let hint: String
    }
    
    // MARK: - Properties
    // MARK: Immutable
    
    private let beer: Beer
    
    // MARK: Mutable
    
    private var cancellables = Set<AnyCancellable>()
    
    private var percentage = ""
    private var percentageHint = "abv"
    private var gravity = ""
    private var gravityHint = "gravity"
    private var bitterness = ""
    private var bitternessHint = "bitterness"
    
    // MARK: Published
    
    @Published private(set) var name = ""
    @Published private(set) var firstBrewed = ""
    @Published private(set) var leftEntries = [LeftEntry]()
    
    @Published private(set) var ingredients = ""
    @Published private(set) var ingredientsHint = "Ingredients"
    @Published private(set) var description = ""
    @Published private(set) var descriptionHint = "Description"
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
        firstBrewed = beer.firstBrewed
        gravity = "\(Int(beer.gravity))"
        if let bitterness = beer.bitterness {
            self.bitterness = "\(bitterness)"
        }
        ingredients = beer.ingredients
            .map { $0.prefix(1).capitalized + $0.dropFirst() }
            .joined(separator: " ")
        description = beer.description
        
        createRightInfoEntries()
    }
    
    private func setupObserving() {
        Image.fetchImage(from: beer.imageUrlString)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
            .store(in: &cancellables)
    }
    
    // MARK: - Helpers
    
    private func createRightInfoEntries() {
        leftEntries = [
            LeftEntry(
                imageName: "percentage",
                text: percentage,
                hint: percentageHint
            ),
            LeftEntry(
                imageName: "gravity",
                text: gravity,
                hint: gravityHint
            ),
            LeftEntry(
                imageName: "bitterness",
                text: bitterness,
                hint: bitternessHint
            )
        ]
    }
}

