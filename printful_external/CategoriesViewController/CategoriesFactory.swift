//
//  CategoriesFactory.swift
//  printful_external
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import UIKit
import Services

final class CategoriesFactory {

    func createController(handlers: CategoriesResources.Handlers, services: ServicesContextProtocol) -> UIViewController {
        let viewModel = CategoriesViewModel(handlers: handlers, services: services)
        let viewController = CategoriesViewController()

        viewController.configure(with: viewModel)

        return viewController
    }
}
