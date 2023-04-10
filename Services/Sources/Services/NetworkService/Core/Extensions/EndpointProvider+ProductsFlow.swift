//
//  EndpointProvider+ProductsFlow.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

extension EndpointProvider {
    func productsEndpointPath() -> String? {
        return domain() + "/products"
    }
}
