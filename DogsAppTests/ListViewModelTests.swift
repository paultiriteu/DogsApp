//
//  ListViewModelTests.swift
//  DogsAppTests
//
//  Created by Paul-Ioan-George TIRITEU on 25.03.2023.
//

import XCTest
import Combine
@testable import DogsApp

final class ListViewModelTests: XCTestCase {
    private var sut: ListViewModel!

    func testGetBreedsLoading() {
        let expectation = expectation(description: "isLoading is called")
        let sut = makeSUT()
        
        let cancellable = sut.$breeds
            .sink { breeds in
                expectation.fulfill()
                XCTAssertFalse(sut.isLoading)
            }
        
        sut.getBreeds()
        XCTAssertTrue(sut.isLoading)
        
        wait(for: [expectation], timeout: 0.1)
        XCTAssertNotNil(cancellable)
    }
}


// MARK: - Helper
extension ListViewModelTests {
    func makeSUT(service: Service = APIService(), configuration: ServiceConfiguration = ServiceConfiguration(config: MockConfig())) -> ListViewModel {
        let repository = ListRepository(service: service, configuration: configuration)
        return makeSUT(repository: repository)
    }
    
    func makeSUT(repository: ListRepositoryProtocol) -> ListViewModel {
        return ListViewModel(repository: repository)
    }
}
