
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

class FloatingController: NSWindowController, NSWindowDelegate {
    static let shared = FloatingController()
    public var floatingWindow: BorderlessDrag?
    
    private let floatingSymbolName = "pin.fill" // Symbol when the window is floating
    private let notFloatingSymbolName = "pin.slash.fill" // Symbol when the window is not floating

    func showFloatingWindow() {
       if floatingWindow == nil {
            let webView = WKWebView()
            webView.load(URLRequest(url: URL(string: "https://chat.com")!))
            webView.allowsMagnification = true
            webView.allowsBackForwardNavigationGestures = true
            webView.pageZoom = (0.8)
            
            let contentRect = NSRect(x: 1250, y: 400, width: 400, height: 647)
            floatingWindow = BorderlessDrag(contentRect: contentRect, styleMask: [.titled, .closable, .miniaturizable, .resizable], backing: .buffered, defer: false)
            floatingWindow?.minSize = NSSize(width: 100, height: 0)
            floatingWindow?.backgroundColor = NSColor.clear
            floatingWindow?.contentView = webView
            floatingWindow?.hasShadow = false
            floatingWindow?.delegate = self
            floatingWindow?.level = .floating 
            let accessoryVC = TitleBarAccessoryViewController()
            accessoryVC.layoutAttribute = .right
            floatingWindow?.addTitlebarAccessoryViewController(accessoryVC)
        } else {
            floatingWindow?.makeKeyAndOrderFront(nil)
}}   
        func windowShouldClose(_ sender: NSWindow) -> Bool {
        floatingWindow?.orderOut(nil) // This to ensure content is not lost within the session
        return false 
}}
