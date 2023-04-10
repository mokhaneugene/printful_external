//
//  Category.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public struct Category: Codable {

    // MARK: - CodingKeys

    private enum CodingKeys: String, CodingKey {
        case id
        case parent_id
        case image_url
        case catalog_position
        case size
        case title
    }

    public let id: Int
    public let parent_id: Int
    public let image_url: String
    public var catalog_position: Int?
    public let size: String
    public let title: String

    // MARK: - Init

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decode(Int.self, forKey: .id)
        parent_id = try values.decode(Int.self, forKey: .parent_id)
        image_url = try values.decode(String.self, forKey: .image_url)
        catalog_position = try values.decodeIfPresent(Int.self, forKey: .catalog_position)
        size = try values.decode(String.self, forKey: .size)
        title = try values.decode(String.self, forKey: .title)
    }
}
