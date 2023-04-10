//
//  CategoriesResponse.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public struct CategoriesResponse: Codable {

    // MARK: - CodingKeys

    private enum CodingKeys: String, CodingKey {
        case categories
    }

    public let categories: [Category]

    // MARK: - Init
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        categories = try values.decode([Category].self, forKey: .categories)
    }
}
