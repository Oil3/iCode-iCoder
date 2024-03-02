//
//  ContentView.swift
//  iCode
//
//  Created by ZZS on 17/02/2024.
//
import SwiftUI
import WebKit

struct ContentView: View {
    @State private var isWindowOpen = false
    @State private var searchText = ""


    var body: some View {
        NavigationSplitView {
            SnippetView()
        } detail: {
            BrowserView(searchText: $searchText)
            }
        .searchable(text: $searchText) // Adds a search field.
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: {
                        // Open the window when the button is clicked
                    FloatingController.shared.showFloatingWindow()                    }) {
                        Text("Floating")
                    }
                }
  }          }
            
        }
