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
        let request = URLRequest(url: chatURL)
        nsView.load(request)
    }
}
