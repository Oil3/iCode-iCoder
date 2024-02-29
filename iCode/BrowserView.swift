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
    
    func makeNSView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        if nsView.url == nil {
            let request = URLRequest(url: URL(string: "https://chat.openai.com")!)
            nsView.load(request)
        }
    }
}

// BrowserContainerView to manage BrowserView
