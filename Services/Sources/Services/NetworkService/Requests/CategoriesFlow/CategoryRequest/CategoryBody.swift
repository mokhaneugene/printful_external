//
//  CategoryBody.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public struct CategoryBody: BodyProtocol, UrlPathProtocol {

    // MARK: - CodingKeys

    private enum CodingKeys: String, CodingKey {
        case id
    }

    public let id: Int

    // MARK: - Init

    public init(id: Int) {
        self.id = id
    }

    // MARK: - Encode

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)

        try values.encode(id, forKey: .id)
    }

    // MARK: - Public methods

    public func getAdditionToPath() -> String {
        return "/\(id)"
    }
}
