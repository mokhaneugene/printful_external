//
//  RuleRequest.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation
import Alamofire

public struct RuleRequest {

    let headers: HTTPHeaders
    let httpMethod: HTTPMethod

    // MARK: - Init
    
    public init(headers: HTTPHeaders = RuleRequest.basicHTTPHeaders(), httpMethod: HTTPMethod) {
        self.headers = headers
        self.httpMethod = httpMethod
    }

    public static func basicHTTPHeaders() -> HTTPHeaders {
        return [HTTPHeader.accept(HeaderContent.json.value),
                HTTPHeader.contentType(HeaderContent.json.value)]
    }
}
