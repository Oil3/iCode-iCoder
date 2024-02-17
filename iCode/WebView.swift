//
//  WebView.swift
//  iCode
//
//  Created by ZZS on 17/02/2024.
//

import SwiftUI
import WebKit

struct BrowserView: NSViewRepresentable {
    var url: URL
    
    func makeNSView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        nsView.load(request)
    }
}
