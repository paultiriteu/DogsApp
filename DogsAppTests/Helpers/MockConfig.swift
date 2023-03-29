//
//  MockConfig.swift
//  DogsAppTests
//
//  Created by Paul-Ioan-George TIRITEU on 28.03.2023.
//

import Foundation
@testable import DogsApp

struct MockConfig: Config {
    var baseURL: URL {
        let bundle = Bundle(for: TestBundleClass.self)
        return bundle.url(forResource: "mock", withExtension: "bundle")!
    }
}

private class TestBundleClass { }
