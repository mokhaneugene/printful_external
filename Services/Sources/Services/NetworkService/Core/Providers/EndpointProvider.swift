//
//  EndpointProvider.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

protocol EndpointProviderProtocol {
    func endpointPath<Request: RequestProtocol>(for request: Request) -> String?
}

class EndpointProvider: EndpointProviderProtocol {
    // MARK: - Constants
    private struct Constants {
        static let prefix: String = "https://"
    }

    private(set) var environment: Environment

    // MARK: - Init
    init(environment: Environment) {
        self.environment = environment
    }

    // MARK: - Public methods
    func endpointPath<Request: RequestProtocol>(for request: Request) -> String? {
        switch request {
        case is CategoriesRequest:
            return categoriesEndpointPath()
        case is CategoryRequest:
            return categoriesEndpointPath()
        case is ProductsRequest:
            return productsEndpointPath()
        case is ProductRequest:
            return productsEndpointPath()
        default:
            print("Unsupported request")
            return nil
        }
    }

    func domain() -> String {
        return String(Constants.prefix) + environment.domain
    }
}
