//
//  URLExtension.swift
//  viper
//
//  Created by Sergii Avilov on 1/19/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

extension URL {
    var queryItems: [String: String]? {
        return URLComponents(url: self, resolvingAgainstBaseURL: false)?
            .queryItems?
            .flatMap { $0.dictionaryRepresentation }
            .reduce([:], +)
    }
}

extension URLQueryItem {
    var dictionaryRepresentation: [String: String]? {
        if let value = value {
            return [name: value]
        }
        return nil
    }
}

func +<Key, Value> (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
    var result = lhs
    rhs.forEach{ result[$0] = $1 }
    return result
}
