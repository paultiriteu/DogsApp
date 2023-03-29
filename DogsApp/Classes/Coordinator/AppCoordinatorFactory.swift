//
//  AppCoordinatorFactory.swift
//  DogsApp
//
//  Created by Paul-Ioan-George TIRITEU on 24.03.2023.
//

import UIKit
import SwiftUI

class AppCoordinatorFactory {
    
    func createListViewController(viewModel: ListViewModel) -> UIViewController {
        let view = ListView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
