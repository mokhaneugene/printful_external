//
//  ProductResponse.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public struct ProductResponse: Codable {

    // MARK: - CodingKeys

    private enum CodingKeys: String, CodingKey {
        case product
    }

    public let product: Product

    // MARK: - Init

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        product = try values.decode(Product.self, forKey: .product)
    }
}
