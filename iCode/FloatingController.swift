//
//  NSWindow.swift
//  iCode
//
//  Created by ZZS on 18/02/2024.
    //

import AppKit
import WebKit

class FloatingController: NSWindowController {
    static let shared = FloatingController()

    private var floatingWindow: NSWindow?

    func showFloatingWindow() {
        if floatingWindow == nil {
            let webView = WKWebView()
            webView.load(URLRequest(url: URL(string: "https://chat.openai.com")!))

            let contentRect = NSRect(x: 0, y: 0, width: 480, height: 300)
            floatingWindow = NSWindow(contentRect: contentRect, styleMask: [.titled, .borderless, .closable, .miniaturizable, .resizable, .fullSizeContentView], backing: .buffered, defer: false)
            floatingWindow?.contentView = webView
            floatingWindow?.makeKeyAndOrderFront(nil)
            floatingWindow?.level = .floating
            floatingWindow?.title = "Floating Window"
        } else {
            floatingWindow?.makeKeyAndOrderFront(nil)
        }
    }

}
