
//  iCode
//
//  Created by ZZS on 18/02/2024.
    //
import AppKit
import WebKit

class BorderlessDrag: NSWindow {
override var canBecomeKey: Bool { return true }
override var canBecomeMain: Bool { return true }
}

class FloatingController: NSWindowController {
    static let shared = FloatingController()

    public var floatingWindow: BorderlessDrag?

    func showFloatingWindow() {
        if floatingWindow == nil {
            let webView = WKWebView()
            webView.load(URLRequest(url: URL(string: "https://chat.com")!))
            webView.allowsMagnification = true
            webView.allowsBackForwardNavigationGestures = true
            webView.pageZoom = (0.9)
            
            let contentRect = NSRect(x: 1250, y: 400, width: 400, height: 647)
            floatingWindow = BorderlessDrag(contentRect: contentRect, styleMask: [.titled, .closable, .miniaturizable, .resizable], backing: .buffered, defer: false)
            floatingWindow?.level = .floating               
            floatingWindow?.minSize = NSSize(width: 50, height: 50)
            floatingWindow?.backgroundColor = NSColor.clear
            floatingWindow?.contentView = webView
            floatingWindow?.makeKeyAndOrderFront(nil)
            floatingWindow?.makeKeyAndOrderFront(nil) 
        } else {
            floatingWindow?.makeKey()
        }
    }
}
