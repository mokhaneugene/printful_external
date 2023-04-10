//
//  BodyProtocol.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation
import Alamofire

public protocol BodyProtocol: Encodable {

}

extension BodyProtocol {
    func toParameters() throws -> Parameters? {
        let encoder = JSONEncoder()

        guard let data = try? encoder.encode(self) else {
            throw ResponseError.encodingFailure
        }

        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            throw ResponseError.jsonSerializationFailure
        }

        return json.isEmpty ? nil : json
    }
}
