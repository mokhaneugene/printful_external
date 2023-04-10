//
//  RequestDetails.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation
import Alamofire

public struct RequestDetails {

    let urlPath: UrlPathProtocol
    let queryItems: QueryItemsProtocol
    let ruleEncoding: RuleEncoding
    let encoding: ParameterEncoding

    // MARK: - Init
    public init(urlPath: UrlPathProtocol = EmptyUrlPath(), queryItems: QueryItemsProtocol = EmptyQueryItems(), ruleEncoding: RuleEncoding) {
        self.urlPath = urlPath
        self.queryItems = queryItems
        self.ruleEncoding = ruleEncoding

        switch ruleEncoding {
        case .JSONEncoding:
            self.encoding = JSONEncoding()
        }
    }
}
