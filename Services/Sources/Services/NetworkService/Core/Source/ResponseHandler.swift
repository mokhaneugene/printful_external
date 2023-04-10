//
//  ResponseHandler.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation
import Alamofire

final class ResponseHandler<Request: RequestProtocol> {

    let url: URL
    let request: Request
    let completion: Request.Completion

    // MARK: - Init

    init(url: URL, request: Request, completion: @escaping Request.Completion) {
        self.url = url
        self.request = request
        self.completion = completion
    }

    // MARK: - Public methods

    func handleResponse(data: DataResponse<Data, AFError>) {
        let statusCode = HttpStatusCode(data.response?.statusCode ?? .zero)

        switch data.result {
        case .success(let data):
            guard let responseModel = decodeResponseBody(data: data, statusCode: statusCode, request: request) else {
                completion(.failure(.mappingFailure))
                return
            }
            let response = ResponseBody<Request.Response>(responseModel: responseModel, httpStatusCode: statusCode)
            completion(.success(response))
        case .failure(let error):
            let error = decodeResponseError(data: data.data, statusCode: statusCode, error: error)
            completion(.failure(error))
        }
    }
}

// MARK: - Private methods

private extension ResponseHandler {
    func decodeResponseError(data: Data?, statusCode: HttpStatusCode, error: AFError) -> ResponseError {
        let backendError = BackendError(httpStatusCode: statusCode, error: error)

        return .backend(backendError)
    }

    func decodeResponseBody<Request: RequestProtocol>(data: Data, statusCode: HttpStatusCode, request: Request) -> Request.Response? {
        do {
            let responseModel = try extractResponse(data: data, statusCode: statusCode, request: request)
            return responseModel
        } catch {
            print("Mapping response body for request: \(request). Error: \(error)")
            return nil
        }
    }

    func extractResponse<Request: RequestProtocol>(data: Data, statusCode: HttpStatusCode, request: Request) throws -> Request.Response {
        guard Request.Response.self != Void.self else {
            return () as! Request.Response
        }

        return try request.response(data, statusCode: statusCode)
    }
}
