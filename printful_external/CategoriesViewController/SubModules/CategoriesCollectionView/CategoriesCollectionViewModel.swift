//
//  CategoriesCollectionViewModel.swift
//  printful_external
//
//  Created by Eugene Mokhan on 11/04/2023.
//

import Foundation

protocol CategoriesCollectionViewModelling {
    var onStateChange: ((CategoriesCollectionResources.State) -> Void)? { get set }

    func launch()
    func getNumberOfItems(in section: Int) -> Int
    func getModel(for indexPath: IndexPath) -> CategoriesCellViewModelling?
    func willDisplay(with indexPath: IndexPath)
    func didSelectItem(at indexPath: IndexPath)
}

final class CategoriesCollectionViewModel: CategoriesCollectionViewModelling {

    typealias Constants = CategoriesCollectionResources.Constants.Mock

    var onStateChange: ((CategoriesCollectionResources.State) -> Void)?

    // MARK: - Private

    private let handlers: CategoriesCollectionResources.Handlers
    private let models: [CategoriesCellModel]

    private var cellHandlers: CategoriesCellResources.Handlers?
    private var displayItems: [CategoriesCellModel] = []
    private var currentPage: Int = .zero

    // MARK: - Init

    init(handlers: CategoriesCollectionResources.Handlers, models: [CategoriesCellModel]) {
        self.handlers = handlers
        self.models = models
    }

    // MARK: - Public methods

    func launch() {
        setupModels()
    }

    func getNumberOfItems(in section: Int) -> Int {
        return displayItems.count
    }

    func getModel(for indexPath: IndexPath) -> CategoriesCellViewModelling? {
        guard let handlers = cellHandlers, let model = displayItems[safe: indexPath.row] else { return nil }

        return CategoriesCellViewModel(handlers: handlers, model: model)
    }

    func willDisplay(with indexPath: IndexPath) {
        let lastItemNumber = displayItems.count - 1
        guard indexPath.row == lastItemNumber else { return }

        currentPage += 1
        loadNextPage()
    }

    func didSelectItem(at indexPath: IndexPath) {
        guard let item = displayItems[safe: indexPath.row] else { return }

        handlers.onCategoryTap(item.id)
    }
}

// MARK: - Private methods

private extension CategoriesCollectionViewModel {
    func setupModels() {
        loadNextPage()
        setupCellHandlers()
    }

    func loadNextPage() {
        let startIndex = currentPage * Constants.itemsOnPage
        let endIndex = startIndex + Constants.itemsOnPage

        displayItems += models.suffix(models.count - startIndex).prefix(endIndex - startIndex).compactMap({ $0 as CategoriesCellModel })
        onStateChange?(.onReload)
    }

    func setupCellHandlers() {
        let handlers = CategoriesCellResources.Handlers()
        cellHandlers = handlers
    }
}
