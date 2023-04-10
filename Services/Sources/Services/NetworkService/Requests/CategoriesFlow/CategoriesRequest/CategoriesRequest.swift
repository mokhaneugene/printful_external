//
//  CategoriesRequest.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation
import Alamofire

final class CategoriesRequest: RequestProtocol {

    typealias Response = ResultResponse<CategoriesResponse>

    var ruleRequest: RuleRequest
    var requestDetails: RequestDetails

    // MARK: - Init

    init() {
        self.ruleRequest = RuleRequest(httpMethod: .get)
        self.requestDetails = RequestDetails(ruleEncoding: .JSONEncoding)
    }

    // MARK: - Public methods
    
    func response(_ body: Data, statusCode: HttpStatusCode) throws -> Response {
        return try JSONDecoder().decode(Response.self, from: body)
    }
}
