//
//  CategoriesViewController.swift
//  printful_external
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import UIKit
import SnapKit

final class CategoriesViewController: UIViewController {

    typealias Constants = CategoriesResources.Constants.View

    // MARK: - Private

    private let collectionView = CategoriesCollectionView()

    private var viewModel: CategoriesViewModelling?

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
    }

    // MARK: - Configure

    func configure(with viewModel: CategoriesViewModelling) {
        self.viewModel = viewModel
        setupViewModel()
    }
}

// MARK: - Private methods

private extension CategoriesViewController {
    func setupItems() {
        view.backgroundColor = .white
        setupCollectionView()
    }

    func setupViewModel() {
        viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

            switch state {
            case .onDataReady(let isDataReady):
                // TODO: - Add loading spinner
                print("isDataReady: \(isDataReady)")
            case .onError(let error):
                // TODO: - Add error view
                print("Error: \(error)")
            case .onCollectionViewModel(let viewModel):
                self.collectionView.configure(with: viewModel)
            }
        }
        viewModel?.launch()
    }

    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension CategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return .init()
    }
}
