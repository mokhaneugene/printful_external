//
//  ResponseBody.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

public struct ResponseBody<ResponseModel> {

    let responseModel: ResponseModel
    let httpStatusCode: HttpStatusCode
    let url: URL?

    init(responseModel: ResponseModel, httpStatusCode: HttpStatusCode, url: URL? = nil) {
        self.responseModel = responseModel
        self.httpStatusCode = httpStatusCode
        self.url = url
    }
}
