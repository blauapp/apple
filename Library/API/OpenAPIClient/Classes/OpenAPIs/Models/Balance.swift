//
// Balance.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Balance: Codable, JSONEncodable, Hashable {

    static let valueRule = StringRule(minLength: nil, maxLength: nil, pattern: "/^d+$/")
    public var value: String
    public var fiat: Double

    public init(value: String, fiat: Double) {
        self.value = value
        self.fiat = fiat
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case value
        case fiat
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encode(fiat, forKey: .fiat)
    }
}

