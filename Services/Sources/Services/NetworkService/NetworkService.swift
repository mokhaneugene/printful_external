//
//  File.swift
//  
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public protocol NetworkServiceHolder {
    var networkService: NetworkServiceProtocol { get }
}

public typealias NetworkServiceProtocol =
NetworkProductsProtocol &
NetworkCategoriesProtocol

public final class NetworkService {

    private(set) var endpointProvider: EndpointProvider
    private(set) var sessionProvider: SessionProviderProtocol

    public init() {
        let environment: Environment = .product
        self.endpointProvider = EndpointProvider(environment: environment)
        self.sessionProvider = SessionProvider(endpointProvider: self.endpointProvider)
    }
}
