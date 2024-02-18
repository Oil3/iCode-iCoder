//
//  Category.swift
//  iCode
//
//  Created by ZZS on 18/02/2024.
//

import SwiftUI

// Enum for navigation categories
enum Category: String, CaseIterable, Identifiable {
    case chat
    case snippet
    case history
    case settings

    var id: String { self.rawValue }

    var localizedName: LocalizedStringKey {
        return LocalizedStringKey(rawValue.capitalized)
    }

    var systemIconName: String {
        switch self {
        case .chat:
            return "text.bubble"
        case .snippet:
            return "note.text"
        case .history:
            return "clock"
        case .settings:
            return "gear"
        }
    }
}
