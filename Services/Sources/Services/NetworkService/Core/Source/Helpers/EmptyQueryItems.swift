//
//  EmptyQueryItems.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public struct EmptyQueryItems: QueryItemsProtocol {

    public init() { }

    public func getQueryItems() -> [URLQueryItem] {
        return []
    }
}
