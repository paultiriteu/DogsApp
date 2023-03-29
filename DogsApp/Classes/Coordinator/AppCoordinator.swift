//
//  AppCoordinator.swift
//  DogsApp
//
//  Created by Paul-Ioan-George TIRITEU on 24.03.2023.
//

import Foundation
import UIKit
import Combine

class AppCoordinator {
    private let apiConfig: Config
    private let apiService: Service
    private let serviceConfiguration: ServiceConfiguration

    private let factory: AppCoordinatorFactory
    private let router: Router
    
    private var subscriptions = [AnyCancellable]()
    
    var rootController: UIViewController {
        return router.navigationController
    }
    
    init(apiConfig: Config, apiService: Service, configuration: ServiceConfiguration, factory: AppCoordinatorFactory, router: Router) {
        self.apiConfig = apiConfig
        self.apiService = apiService
        self.serviceConfiguration = configuration
        self.factory = factory
        self.router = router
        
        start()
    }
    
    convenience init(config: Config = APIConfig()) {
        self.init(apiConfig: APIConfig(),
                  apiService: APIService(),
                  configuration: ServiceConfiguration(config: config),
                  factory: AppCoordinatorFactory(),
                  router: Router(navigationController: UINavigationController()))
    }
    
    private func start() {
        let repository = ListRepository(service: apiService, configuration: serviceConfiguration)
        let viewModel = ListViewModel(repository: repository)
        
        viewModel.onFinished
            .sink { _ in
                // pushViewController
            }
            .store(in: &subscriptions)
        
        let viewController = factory.createListViewController(viewModel: viewModel)
        router.push(viewController)
    }
}
