//
//  BackendError.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public struct BackendError: Equatable {

    let httpStatusCode: HttpStatusCode
    let error: Error?

    public init(httpStatusCode: HttpStatusCode, error: Error? = nil) {
        self.httpStatusCode = httpStatusCode
        self.error = error
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.httpStatusCode == rhs.httpStatusCode
        && (lhs.error as NSError?) == (rhs.error as NSError?)
    }
}
