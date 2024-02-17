//
//  ContentView.swift
//  iCode
//
//  Created by ZZS on 17/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedCategory: Category? = .chat
    @Binding var isSidePanelVisible: Bool

    
    var body: some View {
        NavigationView {
            SidePanelView(selectedCategory: $selectedCategory, isSidePanelVisible: .constant(true))
            
            // Main content view
            Group {
                switch selectedCategory {
                case .chat:
                    // Replace with the URL of your chat
                    BrowserView(url: URL(string: "https://example.com")!)
                case .snippet:
                    // Your snippet view goes here
                    Text("Snippet View")
                case .history:
                    // Your history view goes here
                    Text("History View")
                case .profile:
                    // Replace with the URL of your profile page
                    BrowserView(url: URL(string: "https://chat.openai.com")!)
                case .settings:
                    // Your settings view goes here
                    Text("Settings View")
                case .more:
                    // Your more traditional browser view goes here
                    Text("More Browser View")
                default:
                    Text("Select a category")
                }
            }
            .frame(minWidth: 400, idealWidth: 600, maxWidth: .infinity, minHeight: 300, idealHeight: 500, maxHeight: .infinity)
        }
    }
}
//#Preview {
//    ContentView()
//}
