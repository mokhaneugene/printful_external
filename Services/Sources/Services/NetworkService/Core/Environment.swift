//
//  Environment.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

enum Environment: String {

    // MARK: - Constants

    private enum Constants {
        static let product: String = "api.printful.com"
    }

    case product

    var domain: String {
        switch self {
        case .product: return Constants.product
        }
    }
}
