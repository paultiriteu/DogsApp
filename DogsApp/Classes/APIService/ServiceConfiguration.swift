//
//  ServiceConfiguration.swift
//  DogsApp
//
//  Created by Paul-Ioan-George TIRITEU on 24.03.2023.
//

import Foundation

class ServiceConfiguration {
    let api: ServiceRoute
    
    init(config: Config) {
        self.api = ServiceRoute(baseURL: config.baseURL)
    }
}

struct ServiceRoute {
    private let baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func url(path: String) -> URL {
        return baseURL.appending(path: path)
    }
}

protocol Config {
    var baseURL: URL { get }
}

struct APIConfig: Config {
    var baseURL: URL {
        return URL(string: "https://dogapi.dog/api/v2/")!
    }
}
