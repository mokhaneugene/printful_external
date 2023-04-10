//
//  SessionProvider.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation
import Alamofire

public protocol SessionProviderProtocol {
    func send<Request: RequestProtocol>(request: Request, completion: @escaping Request.Completion)
}

final class SessionProvider: SessionProviderProtocol {

    // MARK: - Constants

    private struct Constants {
        static let timeout: TimeInterval = 30.0
        static let dash: String = "/"
        static let validateStatusCodes = 200..<300
        static let emptyResponseCodes: Set<Int> = [200, 201, 202, 204, 205]
    }

    private let endpointProvider: EndpointProviderProtocol
    private let callbackQueue: DispatchQueue
    private var session: Session?

    // MARK: - Init

    init(endpointProvider: EndpointProviderProtocol,
         callbackQueue: DispatchQueue = .main) {
        self.endpointProvider = endpointProvider
        self.callbackQueue = callbackQueue

        makeSession()
    }

    // MARK: - Public methods

    func send<Request: RequestProtocol>(request: Request, completion: @escaping Request.Completion) {
        sendRequest(request: request) { [weak self] result in
            self?.callbackQueue.async {
                completion(result)
            }
        }
    }
}

// MARK: - Private methods

private extension SessionProvider {
    func makeSession(urlCache: URLCache? = nil) {
        let config = URLSessionConfiguration.default

        config.timeoutIntervalForRequest = Constants.timeout
        config.timeoutIntervalForResource = Constants.timeout
        config.urlCache = urlCache

        self.session = Session(configuration: config)
    }

    func sendRequest<Request: RequestProtocol>(request: Request, completion: @escaping Request.Completion) {
        guard let url = url(by: request) else {
            completion(.failure(.wrongURLRequest))
            return
        }

        let httpHeaders = request.ruleRequest.headers
        guard let urlRequest = try? URLRequest(url: url, method: request.ruleRequest.httpMethod, headers: httpHeaders) else {
            completion(.failure(.wrongURLRequest))
            return
        }

        guard let encodedUrlRequest = try? request.requestDetails.encoding.encode(urlRequest, with: nil) else {
            completion(.failure(.encodingFailure))
            return
        }

        let responseHandler = ResponseHandler(url: url, request: request, completion: completion)
        let dataRequest = session?.request(encodedUrlRequest)
            .validate(statusCode: Constants.validateStatusCodes)
            .responseData(
                queue: callbackQueue,
                emptyResponseCodes: Constants.emptyResponseCodes,
                completionHandler: { dataResponse in
                    responseHandler.handleResponse(data: dataResponse)
                }
            )

        dataRequest?.resume()
    }

    func url<Request: RequestProtocol>(by request: Request) -> URL? {
        guard let path = endpointProvider.endpointPath(for: request) else {
            print("Endpoint path for request: \(request) NOT Found")
            return nil
        }

        var urlComponents = URLComponents(string: path)

        let queryItems = request.requestDetails.queryItems.getQueryItems()
        urlComponents?.queryItems = queryItems

        let additionToPath = request.requestDetails.urlPath.getAdditionToPath()
        if let path = shapeNewPath(currentPath: urlComponents?.path, additionToPath: additionToPath) {
            urlComponents?.path = path
        }

        return urlComponents?.url
    }

    func shapeNewPath(currentPath: String?, additionToPath: String) -> String? {
        guard !additionToPath.isEmpty, var currentPath = currentPath else { return currentPath }

        let isSuffixDash = currentPath.hasSuffix(Constants.dash)
        let isPrefixDash = additionToPath.hasPrefix(Constants.dash)

        if isSuffixDash, isPrefixDash {
            currentPath.removeLast()
            return currentPath + additionToPath
        }

        if !isSuffixDash, !isPrefixDash {
            return currentPath + Constants.dash + additionToPath
        }

        return currentPath + additionToPath
    }
}
