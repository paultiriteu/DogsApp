//
//  DetailsView.swift
//  DogsApp
//
//  Created by Paul-Ioan-George TIRITEU on 29.03.2023.
//

import SwiftUI

struct DetailsView: View {
    let viewModel: DetailsViewModel
    
    var body: some View {
        List(viewModel.information) { <#Binding<Identifiable>#> in
            <#code#>
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(viewModel: DetailsViewModel(breed: Breed(id: "", type: "", attributes: BreedAttributes(name: "", description: "", lifeRange: Range(max: 0, min: 0), maleWeightRange: Range(max: 0, min: 0), femaleWeightRange: Range(max: 0, min: 0), hypoallergenic: false))))
    }
}
