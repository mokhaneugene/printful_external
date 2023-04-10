//
//  CategoriesViewModel.swift
//  printful_external
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation
import Services

protocol CategoriesViewModelling {
    var onStateChange: ((CategoriesResources.State) -> Void)? { get set }

    func launch()
}

final class CategoriesViewModel: CategoriesViewModelling {

    typealias Constants = CategoriesResources.Constants.Mock

    var onStateChange: ((CategoriesResources.State) -> Void)?

    // MARK: - Private

    private let handlers: CategoriesResources.Handlers
    private let services: ServicesContextProtocol

    // MARK: - Init

    init(handlers: CategoriesResources.Handlers, services: ServicesContextProtocol) {
        self.handlers = handlers
        self.services = services
    }

    // MARK: - Public methods

    func launch() {
        
    }
}
