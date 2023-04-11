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

    private var categories: [Services.Category] = []

    // MARK: - Init

    init(handlers: CategoriesResources.Handlers, services: ServicesContextProtocol) {
        self.handlers = handlers
        self.services = services
    }

    // MARK: - Public methods

    func launch() {
        onStateChange?(.onDataReady(false))
        setupModels()
    }
}

// MARK: - Private metohds

private extension CategoriesViewModel {
    func setupModels() {
        setupCategories()
    }

    func setupCategories() {
        services.networkService.categoriesRequest(
            completion: { [weak self] result in
                switch result {
                case .success(let response):
                    self?.categories = response.categories
                    self?.setupCollectionViewModel()
                    self?.onStateChange?(.onDataReady(true))
                case .failure(let error):
                    self?.onStateChange?(.onDataReady(true))
                    self?.onStateChange?(.onError(error.localizedDescription))
                }
            }
        )
    }

    func setupCollectionViewModel() {
        let handlers = CategoriesCollectionResources.Handlers(
            onCategoryTap: { category_id in
                print("category_id: \(category_id)")
            }
        )
        let models = categories.map({ CategoriesCellModel(id: $0.id, title: $0.title, image: $0.image_url) })
        let viewModel = CategoriesCollectionViewModel(handlers: handlers, models: models)
        
        onStateChange?(.onCollectionViewModel(viewModel))
    }
}
