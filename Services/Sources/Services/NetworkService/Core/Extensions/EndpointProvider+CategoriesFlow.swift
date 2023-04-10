//
//  EndpointProvider+CategoriesFlow.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

extension EndpointProvider {
    func categoriesEndpointPath() -> String? {
        return domain() + "/categories"
    }
}
