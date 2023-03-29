//
//  ListViewModel.swift
//  DogsApp
//
//  Created by Paul-Ioan-George TIRITEU on 24.03.2023.
//

import Foundation
import Combine

class ListViewModel: ObservableObject {
    private let repository: ListRepositoryProtocol
    private var subscriptions = [AnyCancellable]()
    
    lazy var onFinished = onFinishedSubject.eraseToAnyPublisher()
    let onFinishedSubject = PassthroughSubject<Void, Never>()

    @Published var breeds: [Breed] = []
    @Published var isLoading = false
    
    init(repository: ListRepositoryProtocol) {
        self.repository = repository
    }
    
    func getBreeds() {
        isLoading = true
        repository.getBreeds()
            .throttle(for: .seconds(1), scheduler: DispatchQueue(label: "", qos: .background), latest: false)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished: print("success")
                case .failure(let error): print("Unresolved error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.breeds = response.data
            })
            .store(in: &subscriptions)
    }
}
