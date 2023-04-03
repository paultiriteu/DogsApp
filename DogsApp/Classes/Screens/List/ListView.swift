//
//  ListView.swift
//  DogsApp
//
//  Created by Paul-Ioan-George TIRITEU on 24.03.2023.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView("Breeds are loading...")
            } else {
                List(viewModel.breeds) { breed in
                    Button(breed.attributes.name) {
                        viewModel.didSelectBreed(breed)
                    }
                }
                .refreshable {
                    viewModel.getBreeds()
                }
            }
        }
        .onAppear {
            viewModel.getBreeds()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: ListViewModel(repository: ListRepository(service: APIService(), configuration: ServiceConfiguration(config: APIConfig()))))
    }
}
