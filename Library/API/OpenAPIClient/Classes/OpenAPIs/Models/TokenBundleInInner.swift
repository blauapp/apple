// TokenBundleInInner.swift
// Copyright (c) 2024 Superdapp, Inc

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public struct TokenBundleInInner: Codable, JSONEncodable, Hashable {
    public enum Erc: String, Codable, CaseIterable {
        case _20 = "ERC_20"
        case _721 = "ERC_721"
        case _1155 = "ERC_1155"
    }

    public enum Actions: String, Codable, CaseIterable {
        case send = "SEND"
        case receive = "RECEIVE"
        case mint = "MINT"
        case burn = "BURN"
        case vote = "VOTE"
        case delegate = "DELEGATE"
        case collect = "COLLECT"
        case approve = "APPROVE"
        case revoke = "REVOKE"
        case swap = "SWAP"
        case borrow = "BORROW"
        case repay = "REPAY"
        case depositStake = "DEPOSIT_STAKE"
        case pauseStake = "PAUSE_STAKE"
        case withdrawStake = "WITHDRAW_STAKE"
        case depositLoan = "DEPOSIT_LOAN"
        case pauseLoan = "PAUSE_LOAN"
        case withdrawLoan = "WITHDRAW_LOAN"
        case depositLiquidity = "DEPOSIT_LIQUIDITY"
        case pauseLiquidity = "PAUSE_LIQUIDITY"
        case withdrawLiquidity = "WITHDRAW_LIQUIDITY"
        case depositFarm = "DEPOSIT_FARM"
        case pauseFarm = "PAUSE_FARM"
        case withdrawFarm = "WITHDRAW_FARM"
    }

    public var id: String
    public var erc: Erc
    public var address: String?
    public var chainId: Int
    public var name: String
    public var symbol: String
    public var decimals: Int
    public var actions: [Actions]
    public var balance: TokenBalance

    public init(id: String, erc: Erc, address: String? = nil, chainId: Int, name: String, symbol: String, decimals: Int, actions: [Actions], balance: TokenBalance) {
        self.id = id
        self.erc = erc
        self.address = address
        self.chainId = chainId
        self.name = name
        self.symbol = symbol
        self.decimals = decimals
        self.actions = actions
        self.balance = balance
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case erc
        case address
        case chainId = "chain_id"
        case name
        case symbol
        case decimals
        case actions
        case balance
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(erc, forKey: .erc)
        try container.encodeIfPresent(address, forKey: .address)
        try container.encode(chainId, forKey: .chainId)
        try container.encode(name, forKey: .name)
        try container.encode(symbol, forKey: .symbol)
        try container.encode(decimals, forKey: .decimals)
        try container.encode(actions, forKey: .actions)
        try container.encode(balance, forKey: .balance)
    }
}
