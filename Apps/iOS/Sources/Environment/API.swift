// API.swift
// Copyright (c) 2024 Superdapp, Inc

import OpenAPIClient
import SwiftUI

@Observable class API {
    func getTokenBundles(addresses: [String]) async throws -> [TokenBundle] {
        //        OpenAPIClientAPI.basePath = "https://bundles.api.blau.app"
        OpenAPIClientAPI.basePath = "http://localhost:17001"

        let postRequest = V1GetTokenBundlesPostRequest(evmPublicKeys: addresses)
        let requestBuilder = DefaultAPI.v1GetTokenBundlesPostWithRequestBuilder(v1GetTokenBundlesPostRequest: postRequest)
        let response = try await requestBuilder.execute()

//        let result =  request
        print(response.body)
//        OpenAPIClientAPI()
//        let bundles = superdapp.
//
//        bundles.map { bundle in
//            bundle.
//        }

//        guard let URL = URL(string: "https://balance.api.blau.app/v1") else { return .init() }
//        var request = URLRequest(url: URL)
//        request.httpMethod = "POST"
//        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//        let bodyObject: [String: Any] = [
//            "publicKeys": addresses,
//        ]
//        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
//
//        let (data, response) = try await session.data(for: request)
//        guard let response = response as? HTTPURLResponse,
//              response.statusCode == 200 else { return .init() }
//
//        let balanceResponses = try JSONDecoder().decode([BalanceResponse].self, from: data)
//
//        return balanceResponses.map { balanceResponse in
//            TokenBundle(tokensIn: [balanceResponse.toToken], actions: [.loan, .stake, .addLiquidity])
//        }
        return []
    }
}

struct APIKey: EnvironmentKey {
    static let defaultValue: API = .init()
}

extension EnvironmentValues {
    var api: API {
        get { self[APIKey.self] }
        set { self[APIKey.self] = newValue }
    }
}
