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

    var body: some View {
        NavigationSplitView {
            SnippetView()
        } detail: {
            BrowserView()
            }
                       
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
