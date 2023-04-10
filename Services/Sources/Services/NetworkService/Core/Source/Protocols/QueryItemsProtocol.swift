//
//  QueryItemsProtocol.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public protocol QueryItemsProtocol {
    func getQueryItems() -> [URLQueryItem]
}
