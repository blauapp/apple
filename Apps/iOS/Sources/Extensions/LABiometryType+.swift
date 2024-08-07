// LABiometryType+.swift
// Copyright (c) 2024 Superdapp, Inc

import Foundation
import LocalAuthentication

public extension LABiometryType {
    var labelText: String {
        switch self {
        case .none: "Login"
        case .touchID: "Sign In With Touch ID"
        case .faceID: "Sign In With Face ID"
        case .opticID: "Sign In With Optic ID"
        @unknown default: "Error"
        }
    }

    var systemImage: String {
        switch self {
        case .none: "faceid"
        case .touchID: "touchid"
        case .faceID: "faceid"
        case .opticID: "opticid"
        @unknown default: "exclamationmark.shield"
        }
    }

    var description: String {
        switch self {
        case .none, .touchID, .faceID, .opticID: "Login with biometrics to unlock your wallet and manage your tokens."
        @unknown default: "Your device must support biometric login to generate your private keys."
        }
    }

    var isSupported: Bool {
        switch self {
        case .none, .touchID, .faceID, .opticID: true
        @unknown default: false
        }
    }
}
