//
//  NetworkService+Products.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public protocol NetworkProductsProtocol {
    func productsRequest(body: ProductsBody?, completion: @escaping (Result<ProductsResponse, ResponseError>) -> Void)
    func productRequest(body: ProductBody, completion: @escaping (Result<ProductResponse, ResponseError>) -> Void)
}

extension NetworkService: NetworkProductsProtocol {

    public func productsRequest(body: ProductsBody? = nil, completion: @escaping (Result<ProductsResponse, ResponseError>) -> Void) {
        sessionProvider.send(request: ProductsRequest(body)) {
            completion($0.map({ $0.responseModel }))
        }
    }

    public func productRequest(body: ProductBody, completion: @escaping (Result<ProductResponse, ResponseError>) -> Void) {
        sessionProvider.send(request: ProductRequest(body)) {
            completion($0.map({ $0.responseModel.result }))
        }
    }
}
