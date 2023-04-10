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
    }

    func setupViewModel() {
        viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

        }
        viewModel?.launch()
    }
}
