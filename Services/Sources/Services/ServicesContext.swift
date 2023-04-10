//
//  ServicesContext.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public typealias ServicesContextProtocol =
NetworkServiceHolder

public struct ServicesContext: ServicesContextProtocol {

    public let networkService: NetworkServiceProtocol

    // MARK: - Init

    public init() {
        networkService = NetworkService()
    }
}
