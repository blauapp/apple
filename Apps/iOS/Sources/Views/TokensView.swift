// TokensView.swift
// Copyright (c) 2024 Superdapp, Inc

import CapsuleSwift
import SwiftUI

struct TokensView: View {
    @EnvironmentObject var capsuleManager: CapsuleManager
    @Environment(\.authorizationController) private var authorizationController
    @Environment(\.settings) private var settings
    @Environment(\.api) private var api
    @Environment(\.dismiss) private var dismiss

    private let avatarBeam = AvatarBeam()
    @State private var tokenTypeFilter: TokenTypeFilter = .allTokens
    @State private var tokenBundles: [TokenBundle] = .init()

    var body: some View {
        @Bindable var settings = settings
        NavigationStack {
            TokensContent()
                .navigationTitle("Tokens")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu(content: {
                            Button {} label: {
                                Label("Deposit Tokens", systemImage: "qrcode")
                            }
                            Divider()
                            Button {
                                settings.presentedFullScreen = .accounts
                            } label: {
                                Label("Accounts", systemImage: "person.text.rectangle")
                            }
                        }, label: {
                            switch capsuleManager.wallet?.publicKey {
                            case let .some(publicKey): avatarBeam.createAvatarView(name: publicKey,
                                                                                   size: 32)
                            case .none: Image(systemName: "exclamationmark.triangle")
                            }
                        })
                    }
                }
        }
        .task {
//            print(result)
            await loadTokensView()
        }
        .sheet(item: $settings.presentedSheet, onDismiss: {
//            Task {
//                await loadTokensView()
//            }
        }, content: { presented in
            NavigationView {
                Group {
                    switch presented {
                    case .send: SendView()
                    case .receive: ReceiveView()
                    case .depositFiat: DepositFiatView()
                    case .withdrawFiat: WithdrawFiatView()
                    case .depositStake: DepositStakeView()
                    case .depositLoan: DepositLoanView()
                    default: fatalError("Create view")
                    }
                }
                .navigationTitle(presented.description)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            settings.presentedSheet = nil
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
            }

        })
        .fullScreenCover(item: $settings.presentedFullScreen, onDismiss: {
//            Task {
//                await loadTokensView()
//            }
        }, content: { presented in
            switch presented {
            case .accounts: AccountsView()
            case .addAccount: AddWatchAccountView()
            case .receive: ReceiveView()
            }
        })
    }

    @ViewBuilder
    private func TokensContent() -> some View {
        switch tokenBundles.count {
        case 0: EmptyContent()
        default: TokenBundlesContent()
        }
    }

    @ViewBuilder
    private func EmptyContent() -> some View {
        ContentUnavailableView {
            Label("Get Started", image: "hand-coins")
        } description: {
            Text("We are going to get you started in under a minute.")
        } actions: {
            Button {
                settings.presentedSheet = .depositFiat
            } label: {
                Label("Buy with Stripe", systemImage: "dollarsign")
                    .fontWeight(.bold)
            }.buttonStyle(.borderedProminent)
                .controlSize(.large)
            Button {
                settings.presentedFullScreen = .receive
            } label: {
                Label("Receive", systemImage: "qrcode")
                    .fontWeight(.bold)
            }.buttonStyle(.bordered)
                .controlSize(.large)
        }
    }

    @ViewBuilder
    private func TokenBundlesContent() -> some View {
        List {
            Section {
                ForEach($tokenBundles) { $tokenBundle in
                    TokenBundleItem(tokenBundle: $tokenBundle)
                }
            } header: {
                FilterItem(filter: $tokenTypeFilter)
            }
        }
    }

    private func loadTokensView() async {
        do {
            let wallets = try await capsuleManager.fetchWallets()
//            tokenBundles = try await api.getTokenBundles(addresses: ["0xa53417F20BB7148a50849770471De251417C3F12"])
            tokenBundles = try await api.getTokenBundles(addresses: wallets.compactMap { $0.address })
        } catch {
            print("LOAD WALLETS \(error)")
        }
    }
}

#Preview {
    TokensView()
        .environmentObject(CapsuleManager(environment: .beta(jsBridgeUrl: nil),
                                          apiKey: ""))
}
