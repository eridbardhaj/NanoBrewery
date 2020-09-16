//
//  BeerStub.swift
//  NanoBreweryTests
//
//  Created by Erid Bardhaj on 9/16/20.
//

import Foundation
@testable import NanoBrewery

struct StubHelper {
    static let beer = Beer(
        id: 3,
        name: "Pilsen Lager Pilsen Lager Pilsen Lager Pilsen Lager",
        tagline: "Unleash. Yeast. Series. Best.",
        description: "Our Unleash the Yeast series was an epic experiment into the differences in aroma and flavour provided by switching up your yeast. We brewed up a wort with a light caramel note and some toasty biscuit flavour, and hopped it with Amarillo and Centennial for a citrusy bitterness. Everything else is down to the yeast. Pilsner yeast ferments with no fruity esters or spicy phenols, although it can add a hint of butterscotch.",
        gravity: 1050,
        bitterness: 60,
        firstBrewed: "07/2007",
        percentage: 4.5,
        imageUrlString: "https://images.punkapi.com/v2/4.png",
        ingredients: [
            "malt",
            "hops",
            "yeast"
        ]
    )
}
