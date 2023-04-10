//
//  ProductRequest.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation
import Alamofire

final class ProductRequest: RequestProtocol {

    typealias Response = ResultResponse<ProductResponse>

    var ruleRequest: RuleRequest
    var requestDetails: RequestDetails

    // MARK: - Init

    init(_ body: ProductBody) {
        self.ruleRequest = RuleRequest(httpMethod: .get)
        self.requestDetails = RequestDetails(urlPath: body, ruleEncoding: .JSONEncoding)
    }

    // MARK: - Public methods

    func response(_ body: Data, statusCode: HttpStatusCode) throws -> ResultResponse<ProductResponse> {
        return try JSONDecoder().decode(Response.self, from: body)
    }
}
