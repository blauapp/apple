//
// Actions.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

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
    case depositFiat = "DEPOSIT_FIAT"
    case pauseFiat = "PAUSE_FIAT"
    case withdrawFiat = "WITHDRAW_FIAT"
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
