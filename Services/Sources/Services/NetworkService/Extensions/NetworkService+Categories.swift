//
//  NetworkService+Categories.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public protocol NetworkCategoriesProtocol {
    func categoriesRequest(completion: @escaping (Result<CategoriesResponse, ResponseError>) -> Void)
    func categoryRequest(body: CategoryBody, completion: @escaping (Result<CategoryResponse, ResponseError>) -> Void)
}

extension NetworkService: NetworkCategoriesProtocol {
    public func categoriesRequest(completion: @escaping (Result<CategoriesResponse, ResponseError>) -> Void) {
        sessionProvider.send(request: CategoriesRequest()) {
            completion($0.map({ $0.responseModel.result }))
        }
    }

    public func categoryRequest(body: CategoryBody, completion: @escaping (Result<CategoryResponse, ResponseError>) -> Void) {
        sessionProvider.send(request: CategoryRequest(body)) {
            completion($0.map({ $0.responseModel.result }))
        }
    }
}
