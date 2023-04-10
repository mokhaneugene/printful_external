//
//  RequestProtocol.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public protocol RequestProtocol {

    associatedtype Response

    typealias Completion = (Result<ResponseBody<Response>, ResponseError>) -> Void

    var ruleRequest: RuleRequest { get }
    var requestDetails: RequestDetails { get }

    func response(_ body: Data, statusCode: HttpStatusCode) throws -> Response
}
