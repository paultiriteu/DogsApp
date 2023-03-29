//
//  Breed.swift
//  DogsApp
//
//  Created by Paul-Ioan-George TIRITEU on 24.03.2023.
//

import Foundation

struct Breed: Decodable {
    let id: String
    let type: String
    let attributes: BreedAttributes
}

struct BreedAttributes: Decodable {
    let name: String
    let description: String
    let lifeRange: Range
    let maleWeightRange: Range
    let femaleWeightRange: Range
    let hypoallergenic: Bool
    
    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case lifeRange = "life"
        case maleWeightRange = "male_weight"
        case femaleWeightRange = "female_weight"
        case hypoallergenic
    }
}

struct Range: Decodable {
    let max: Int
    let min: Int
}

extension Breed: Identifiable { }
