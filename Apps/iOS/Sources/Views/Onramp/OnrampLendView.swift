// OnrampLendView.swift
// Copyright (c) 2024 Superdapp, Inc

import SwiftUI

struct OnrampLendView: View {
    @Environment(\.settings) var settings
    @State var tokenBundle = TokenBundle(tokensIn: [Token()],
                                         actions: [.depositLoan])
    var body: some View {
        List {
            TokenBundleItem(tokenBundle: $tokenBundle)
                .contextMenu(menuItems: {
                    ForEach(tokenBundle.actions) { action in
                        Button(action: {
                            settings.presentedSheet = action
                        }, label: {
                            action.label
                        })
                    }
                })
        }
    }
}

#Preview {
    OnrampLendView()
}
