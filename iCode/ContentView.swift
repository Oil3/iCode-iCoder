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

// actual view
struct ContentView: View {
    @State private var selectedCategory: Category? = .chat
    
    var body: some View {
        NavigationSplitView {
            // Sidebar content
            List(selection: $selectedCategory) {
                        Spacer()
                        

                ForEach(Category.allCases) { category in
                    Label(category.localizedName, systemImage: category.systemIconName)
                        .tag(category)
                }
            }

        } detail: {
            Group {
                switch selectedCategory {
                case .chat:
                    BrowserView()
                case .snippet:
                    SnippetView()
                case .history:
                    // Your history view goes here
                    Text("History View")
                case .settings:
                    PreferencesView()
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
