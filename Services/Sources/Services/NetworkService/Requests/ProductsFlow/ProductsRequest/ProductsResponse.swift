//
//  ProductsResponse.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public struct ProductsResponse: Codable {

    // MARK: - CodingKeys

    private enum CodingKeys: String, CodingKey {
        case products = "result"
    }

    public let products: [Product]

    // MARK: - Init

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        products = try values.decode([Product].self, forKey: .products)
    }
}
