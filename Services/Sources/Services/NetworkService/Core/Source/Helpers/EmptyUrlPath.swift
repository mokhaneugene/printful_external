//
//  EmptyUrlPath.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public struct EmptyUrlPath: UrlPathProtocol {

    public init() { }

    public func getAdditionToPath() -> String {
        return ""
    }
}
