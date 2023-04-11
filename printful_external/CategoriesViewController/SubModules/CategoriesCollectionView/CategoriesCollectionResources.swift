//
//  CategoriesCollectionResources.swift
//  printful_external
//
//  Created by Eugene Mokhan on 11/04/2023.
//

import Foundation

struct CategoriesCollectionResources {

    class Handlers {
        let onCategoryTap: (Int) -> Void

        init(onCategoryTap: @escaping (Int) -> Void) {
            self.onCategoryTap = onCategoryTap
        }
    }

    enum State {
        case onReload
    }

    enum Constants {
        enum View {
            static let lineSpacing: CGFloat = 10.0
            static let itemHeight: CGFloat = 150.0
        }

        enum Mock {
            static let itemsOnPage: Int = 15
        }
    }
}
