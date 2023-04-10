//
//  ProductsRequest.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation
import Alamofire

final class ProductsRequest: RequestProtocol {

    typealias Response = ProductsResponse

    var ruleRequest: RuleRequest
    var requestDetails: RequestDetails

    // MARK: - Init

    init(_ body: ProductsBody?) {
        self.ruleRequest = RuleRequest(httpMethod: .get)
        self.requestDetails = RequestDetails(queryItems: body ?? EmptyQueryItems(), ruleEncoding: .JSONEncoding)
    }

    // MARK: - Public methods

    func response(_ body: Data, statusCode: HttpStatusCode) throws -> ProductsResponse {
        return try JSONDecoder().decode(Response.self, from: body)
    }
}
