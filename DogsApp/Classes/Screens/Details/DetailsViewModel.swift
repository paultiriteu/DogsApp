//
//  DetailsViewModel.swift
//  DogsApp
//
//  Created by Paul-Ioan-George TIRITEU on 29.03.2023.
//

import Foundation

class DetailsViewModel {
    let information: [String: Any]
    
    init(breed: Breed) {
        self.information = [
            "Name": breed.attributes.name,
            "Description": breed.attributes.description,
            "Weight for male": "\(breed.attributes.maleWeightRange.min)kg to \(breed.attributes.maleWeightRange.min)kg",
            "Weight for female": "\(breed.attributes.femaleWeightRange.min)kg to \(breed.attributes.femaleWeightRange.min)kg",
            "Life range": "\(breed.attributes.lifeRange.min) to \(breed.attributes.lifeRange.min) years"
        ]
    }
}
