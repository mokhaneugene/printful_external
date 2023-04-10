//
//  Product.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public struct Product: Codable {

    // MARK: - CodingKeys

    private enum CodingKeys: String, CodingKey {
        case id
        case main_category_id
        case title
        case brand
        case image
    }

    public let id: Int
    public let main_category_id: Int
    public let title: String
    public var brand: String?
    public let image: String

    // MARK: - Init

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decode(Int.self, forKey: .id)
        main_category_id = try values.decode(Int.self, forKey: .main_category_id)
        title = try values.decode(String.self, forKey: .title)
        brand = try values.decodeIfPresent(String.self, forKey: .brand)
        image = try values.decode(String.self, forKey: .image)
    }
}
