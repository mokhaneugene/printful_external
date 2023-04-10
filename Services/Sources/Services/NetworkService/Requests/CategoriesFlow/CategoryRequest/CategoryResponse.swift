//
//  CategoryResponse.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public struct CategoryResponse: Codable {

    // MARK: - CodingKeys

    private enum CodingKeys: String, CodingKey {
        case category
    }

    public let category: Category

    // MARK: - Init

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        category = try values.decode(Category.self, forKey: .category)
    }
}
