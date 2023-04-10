//
//  ResultResponse.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public struct ResultResponse<T: Codable>: Codable {

    // MARK: - CodingKeys

    private enum CodingKeys: String, CodingKey {
        case result
    }

    public let result: T

    // MARK: - Init

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        result = try values.decode(T.self, forKey: .result)
    }
}
