//
//  ListRepository.swift
//  DogsApp
//
//  Created by Paul-Ioan-George TIRITEU on 24.03.2023.
//

import Foundation
import Combine

protocol ListRepositoryProtocol {
    func getBreeds() -> AnyPublisher<DataResponse<[Breed]>, NetworkError>
}

class ListRepository: ListRepositoryProtocol {
    private let apiService: Service
    private let configuration: ServiceConfiguration
    
    init(service: Service, configuration: ServiceConfiguration) {
        self.apiService = service
        self.configuration = configuration
    }
    
    func getBreeds() -> AnyPublisher<DataResponse<[Breed]>, NetworkError> {
        let url = configuration.api.url(path: "breeds")
        return apiService.dataTaskPublisher(for: url, httpMethod: .get)
    }
}
