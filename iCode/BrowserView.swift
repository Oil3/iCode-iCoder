//
//  WebView.swift
//  iCode
//
//  Created by ZZS on 17/02/2024.
//
import SwiftUI
import WebKit

struct BrowserView: NSViewRepresentable {
    // Hardcoded URL
    let chatURL = URL(string: "https://chat.openai.com")!
    @Binding var searchText: String

    
    func makeNSView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        if nsView.url == nil {
            let request = URLRequest(url: chatURL)
            nsView.load(request)
            }
                
        if !searchText.isEmpty {    
            let findConfiguration = WKFindConfiguration()
            findConfiguration.caseSensitive = false
            findConfiguration.wraps = true
            nsView.find(searchText, configuration: findConfiguration) { result in
                // Handle the results of the search
                print("Matches found: \(result)")
            }
    }
}}

// BrowserContainerView to manage BrowserView
