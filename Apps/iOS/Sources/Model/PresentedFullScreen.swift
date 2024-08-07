// PresentedFullScreen.swift
// Copyright (c) 2024 Superdapp, Inc

import Foundation

enum PresentedFullScreen: Identifiable {
    var id: Self { self }
    case receive
    case accounts
    case addAccount
}
