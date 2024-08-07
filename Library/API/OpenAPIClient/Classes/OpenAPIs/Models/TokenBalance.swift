// TokenBalance.swift
// Copyright (c) 2024 Superdapp, Inc

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public struct TokenBalance: Codable, JSONEncodable, Hashable {
    static let valueRule = StringRule(minLength: nil, maxLength: nil, pattern: "/^d+$/")
    public var id: String
    public var value: String
    public var fiat: Double

    public init(id: String, value: String, fiat: Double) {
        self.id = id
        self.value = value
        self.fiat = fiat
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case value
        case fiat
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(value, forKey: .value)
        try container.encode(fiat, forKey: .fiat)
    }
}
