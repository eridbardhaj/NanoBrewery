//
//  Beer.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/10/20.
//

import Foundation

struct Beer: Codable, Equatable {
    
    // MARK: - Properties
    // MARK: Immutable
    
    let id: Int
    let name: String
    let tagline: String
    let firstBrewed: String
    let description: String
    let percentage: Double
    let imageUrlString: String
    let foodPairing: [String]
    
    // MARK: - Protocol Conformance
    // MARK: Codable
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case firstBrewed    = "first_brewed"
        case description
        case percentage     = "abv"
        case imageUrlString = "image_url"
        case foodPairing    = "food_pairing"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        tagline = try values.decode(String.self, forKey: .tagline)
        firstBrewed = try values.decode(String.self, forKey: .firstBrewed)
        description = try values.decode(String.self, forKey: .description)
        percentage = try values.decode(Double.self, forKey: .percentage)
        imageUrlString = try values.decode(String.self, forKey: .imageUrlString)
        foodPairing = try values.decode([String].self, forKey: .foodPairing)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(tagline, forKey: .tagline)
        try container.encode(firstBrewed, forKey: .firstBrewed)
        try container.encode(description, forKey: .description)
        try container.encode(percentage, forKey: .percentage)
        try container.encode(imageUrlString, forKey: .imageUrlString)
        try container.encode(foodPairing, forKey: .foodPairing)
    }
    
    init(id: Int,
         name: String,
         tagline: String,
         firstBrewed: String,
         description: String,
         percentage: Double,
         imageUrlString: String,
         foodPairing: [String]) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.firstBrewed = firstBrewed
        self.description = description
        self.percentage = percentage
        self.imageUrlString = imageUrlString
        self.foodPairing = foodPairing
    }
}
