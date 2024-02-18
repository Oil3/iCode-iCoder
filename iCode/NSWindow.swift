//
//  NSWindow.swift
//  iCode
//
//  Created by ZZS on 18/02/2024.
//

import Cocoa
import WebKit

extension NSWindow {
    static func createFloatingWindow(for url: URL) -> NSWindow {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))

        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered, defer: false)
        window.center()
        window.contentView = webView
        window.level = .floating
        window.title = "More"

        return window
    }
}
