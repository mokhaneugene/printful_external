//
//  CategoriesResources.swift
//  printful_external
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

struct CategoriesResources {

    class Handlers {

    }

    enum State {
        case onDataReady(Bool)
        case onError(String)
        case onCollectionViewModel(CategoriesCollectionViewModelling)
    }

    enum Constants {
        enum View {

        }

        enum Mock {
            
        }
    }
}
