//
//  Beer.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/10/20.
//

import Foundation

struct Beer: Decodable, Equatable {
    
    // MARK: - Inner Types
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case description
        case firstBrewed    = "first_brewed"
        case gravity        = "target_fg"
        case bitterness     = "ibu"
        case percentage     = "abv"
        case imageUrlString = "image_url"
        case ingredients    = "ingredients"
    }
    
    struct IngredientKey: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        var intValue: Int? { return nil }
        init?(intValue: Int) { return nil }
    }
    
    // MARK: - Properties
    // MARK: Immutable
    
    let id: Int
    let name: String
    let tagline: String
    let description: String
    let firstBrewed: String
    let gravity: Double
    let bitterness: Double?
    let percentage: Double
    let imageUrlString: String
    let ingredients: [String]
    
    // MARK: - Protocol Conformance
    // MARK: Codable
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        tagline = try values.decode(String.self, forKey: .tagline)
        description = try values.decode(String.self, forKey: .description)
        gravity = try values.decode(Double.self, forKey: .gravity)
        bitterness = try values.decodeIfPresent(Double.self, forKey: .bitterness)
        firstBrewed = try values.decode(String.self, forKey: .firstBrewed)
        percentage = try values.decode(Double.self, forKey: .percentage)
        imageUrlString = try values.decode(String.self, forKey: .imageUrlString)
        
        let ingredientContainer = try values.nestedContainer(keyedBy: IngredientKey.self, forKey: .ingredients)
        ingredients = ingredientContainer.allKeys.map { $0.stringValue }
    }
    
    init(id: Int,
         name: String,
         tagline: String,
         description: String,
         gravity: Double,
         bitterness: Double,
         firstBrewed: String,
         percentage: Double,
         imageUrlString: String,
         ingredients: [String]) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.description = description
        self.gravity = gravity
        self.bitterness = bitterness
        self.firstBrewed = firstBrewed
        self.percentage = percentage
        self.imageUrlString = imageUrlString
        self.ingredients = ingredients
    }
}
