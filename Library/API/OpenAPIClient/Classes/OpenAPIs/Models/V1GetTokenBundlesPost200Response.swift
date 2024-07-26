//
// V1GetTokenBundlesPost200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct V1GetTokenBundlesPost200Response: Codable, JSONEncodable, Hashable {

    public var tokenBundles: [V1GetTokenBundlesPost200ResponseTokenBundlesInner]

    public init(tokenBundles: [V1GetTokenBundlesPost200ResponseTokenBundlesInner]) {
        self.tokenBundles = tokenBundles
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case tokenBundles = "token_bundles"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(tokenBundles, forKey: .tokenBundles)
    }
}

