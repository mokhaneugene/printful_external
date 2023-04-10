//
//  ProductsBody.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public struct ProductsBody: BodyProtocol, QueryItemsProtocol {

    // MARK: - CodingKeys

    private enum CodingKeys: String, CodingKey {
        case category_id
    }

    public let category_id: Int

    // MARK: - Init

    public init(category_id: Int) {
        self.category_id = category_id
    }

    // MARK: - Encode

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)

        try values.encode(category_id, forKey: .category_id)
    }

    // MARK: - Public methods

    public func getQueryItems() -> [URLQueryItem] {
        return [URLQueryItem(name: "category_id", value: String(category_id))]
    }
}
