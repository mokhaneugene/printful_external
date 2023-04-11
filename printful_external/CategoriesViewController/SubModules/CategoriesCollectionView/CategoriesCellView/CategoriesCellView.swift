//
//  CategoriesCellView.swift
//  printful_external
//
//  Created by Eugene Mokhan on 11/04/2023.
//

import UIKit

final class CategoriesCellView: UICollectionViewCell {

    typealias Constants = CategoriesCellResources.Constants.View

    static var reuseId: String { String(describing: self) }

    // MARK: - Private

    private let titleLabel = UILabel()

    private var viewModel: CategoriesCellViewModelling?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupItems()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupItems()
    }

    // MARK: - Configure

    func configure(with viewModel: CategoriesCellViewModelling) {
        self.viewModel = viewModel
        setupViewModel()
    }
}

// MARK: - Private methods

private extension CategoriesCellView {
    func setupItems() {
        setupTitleLabel()
    }

    func setupViewModel() {
        viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

            switch state {
            case .onTitle(let text):
                self.titleLabel.text = text
            }
        }
        viewModel?.launch()
    }

    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
