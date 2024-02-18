//
//  ContentView.swift
//  iCode
//
//  Created by ZZS on 17/02/2024.
//

import SwiftUI

// improvements with navigationsplitview
enum Category: String, CaseIterable, Identifiable {
    case chat
    case snippet
    case history
    case profile
    case settings
    case more

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
        case .profile:
            return "person.crop.circle"
        case .settings:
            return "gear"
        case .more:
            return "ellipsis.circle"
        }
    }
}

// actual view
struct ContentView: View {
    @State private var selectedCategory: Category? = .chat
    
    var body: some View {
        NavigationSplitView {
            // Sidebar content
            List(selection: $selectedCategory) {
                ForEach(Category.allCases) { category in
                    Label(category.localizedName, systemImage: category.systemIconName)
                        .tag(category)
                }
            }

        } detail: {
            Group {
                switch selectedCategory {
                case .chat:
                    // Your chat view goes here
                    Text("Chat View")
                case .snippet:
                    SnippetView()
                case .history:
                    // Your history view goes here
                    Text("History View")
                case .profile:
                    // Your profile view goes here
                    Text("Profile View")
                case .settings:
                    // Your settings view goes here
                    Text("Settings View")
                case .more:
                    // Your more view goes here
                    Text("More View")
                default:
                    Text("Select a category")
                }
            }
//            .frame(minWidth: 400, idealWidth: 600, maxWidth: .infinity)
        }
    }
}

// ContentView previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
