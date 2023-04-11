//
//  Collection+Safe.swift
//  printful_external
//
//  Created by Eugene Mokhan on 11/04/2023.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Iterator.Element? {
        return index >= startIndex && index < endIndex ? self[index] : nil
    }
}
