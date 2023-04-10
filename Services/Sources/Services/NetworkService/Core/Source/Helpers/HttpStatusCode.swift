//
//  HttpStatusCode.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public enum HttpStatusCode: Hashable {
    case undefined(Int)
    case success
    case badRequest
    case forbidden
    case notFound
    case internalServerError

    public init(_ statusCode: Int) {
        switch statusCode {
        case 200: self = .success
        case 400: self = .badRequest
        case 403: self = .forbidden
        case 404: self = .notFound
        case 500: self = .internalServerError
        default: self = .undefined(statusCode)
        }
    }

    public var rawValue: Int {
        switch self {
        case .undefined(let statusCode): return statusCode
        case .success: return 200
        case .badRequest: return 400
        case .forbidden: return 403
        case .notFound: return 404
        case .internalServerError: return 500
        }
    }
}
