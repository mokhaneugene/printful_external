//
//  ResponseError.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public enum ResponseError: Error, Equatable {
    /// An error returned by the backend
    case backend(BackendError)
    /// Failed to decode the responses
    case mappingFailure
    /// Failed to encode the responses
    case encodingFailure
    /// Failed to JSONSerialization the responses
    case jsonSerializationFailure
    /// Failed to get the response
    case wrongURLRequest

    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.mappingFailure, .mappingFailure),
            (.encodingFailure, .encodingFailure),
            (.jsonSerializationFailure, .jsonSerializationFailure),
            (.wrongURLRequest, .wrongURLRequest):
            return true
        case let (.backend(lhsBackendError), .backend(rhsBackendError)):
            return lhsBackendError == rhsBackendError
        default:
            return false
        }
    }
}
