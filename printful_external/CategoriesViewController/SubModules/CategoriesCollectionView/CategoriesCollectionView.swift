//
//  CategoriesCollectionView.swift
//  printful_external
//
//  Created by Eugene Mokhan on 11/04/2023.
//

import UIKit

final class CategoriesCollectionView: UIView {

    typealias Constants = CategoriesCollectionResources.Constants.View

    // MARK: - Private

    private var collectionView: UICollectionView?

    private var viewModel: CategoriesCollectionViewModelling?

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setupItems()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupItems()
    }

    // MARK: - Configure

    func configure(with viewModel: CategoriesCollectionViewModelling) {
        self.viewModel = viewModel
        setupViewModel()
    }
}

// MARK: - Private methods

private extension CategoriesCollectionView {
    func setupItems() {
        setupCollectionView()
    }

    func setupViewModel() {
        viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

            switch state {
            case .onReload:
                self.collectionView?.reloadData()
            }
        }
        viewModel?.launch()
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constants.lineSpacing
        layout.minimumInteritemSpacing = Constants.lineSpacing
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoriesCellView.self, forCellWithReuseIdentifier: CategoriesCellView.reuseId)

        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.collectionView = collectionView
    }
}

// MARK: - UICollectionViewDataSource

extension CategoriesCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getNumberOfItems(in: section) ?? .zero
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCellView.reuseId, for: indexPath)
        guard let cell = cell as? CategoriesCellView, let viewModel = viewModel?.getModel(for: indexPath) else { return .init() }

        cell.configure(with: viewModel)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel?.willDisplay(with: indexPath)
    }
}

// MARK: - UICollectionViewDelegate

extension CategoriesCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.didSelectItem(at: indexPath)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CategoriesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width, height: Constants.itemHeight)
    }
}
