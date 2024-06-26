// Button+.swift
// Copyright (c) 2024 Party Labs, Inc

import SwiftUI

extension Button {
    @ViewBuilder
    func setButtonStyle(isSelected: Bool) -> some View {
        switch isSelected {
        case true: buttonStyle(BorderedProminentButtonStyle())
        case false: buttonStyle(BorderedButtonStyle())
        }
    }
}
