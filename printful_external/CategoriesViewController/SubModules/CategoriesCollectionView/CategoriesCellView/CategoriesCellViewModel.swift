//
//  CategoriesCellViewModel.swift
//  printful_external
//
//  Created by Eugene Mokhan on 11/04/2023.
//

import Foundation

protocol CategoriesCellViewModelling {
    var onStateChange: ((CategoriesCellResources.State) -> Void)? { get set }

    func launch()
}

final class CategoriesCellViewModel: CategoriesCellViewModelling {

    typealias Constants = CategoriesCellResources.Constants.Mock

    var onStateChange: ((CategoriesCellResources.State) -> Void)?

    // MARK: - Private

    private let handlers: CategoriesCellResources.Handlers
    private let model: CategoriesCellModel

    // MARK: - Init

    init(handlers: CategoriesCellResources.Handlers, model: CategoriesCellModel) {
        self.handlers = handlers
        self.model = model
    }

    // MARK: - Public methods

    func launch() {
        onStateChange?(.onTitle(model.title))
    }
}
