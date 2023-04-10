//
//  CategoryRequest.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation
import Alamofire

final class CategoryRequest: RequestProtocol {

    typealias Response = ResultResponse<CategoryResponse>

    var ruleRequest: RuleRequest
    var requestDetails: RequestDetails

    // MARK: - Init

    init(_ body: CategoryBody) {
        self.ruleRequest = RuleRequest(httpMethod: .get)
        self.requestDetails = RequestDetails(urlPath: body, ruleEncoding: .JSONEncoding)
    }

    // MARK: - Public methods

    func response(_ body: Data, statusCode: HttpStatusCode) throws -> ResultResponse<CategoryResponse> {
        return try JSONDecoder().decode(Response.self, from: body)
    }
}
