//
//  HeaderContent.swift
//  Services
//
//  Created by Eugene Mokhan on 10/04/2023.
//

import Foundation

enum HeaderContent {
    private enum Constants {
        static let application: String = "application"
    }

    case json

    var value: String {
        switch self {
        case .json: return Constants.application + "/json"
        }
    }
}
