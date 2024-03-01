
//  iCode
//
//  Created by ZZS on 18/02/2024.
    //

import Foundation
import WebKit

class BorderlessDrag: NSWindow {
    override var canBecomeKey: Bool { return true }
    override var canBecomeMain: Bool { return true }
}

class FloatingController: NSWindowController, NSWindowDelegate {
    static let shared = FloatingController()
    public var floatingWindow: BorderlessDrag?
    var titleBarButtons: TitleBarButtons? 
    var isAutoHideEnabled = false
    
    func showFloatingWindow() {
        if floatingWindow == nil {
            let webView = WKWebView()
            webView.load(URLRequest(url: URL(string: "https://chat.openai.com")!))
            webView.allowsMagnification = true
            webView.allowsBackForwardNavigationGestures = true
            webView.pageZoom = (1)
            
            let contentRect = NSRect(x: 1250, y: 400, width: 400, height: 647)
            floatingWindow = BorderlessDrag(contentRect: contentRect, styleMask: [.titled, .closable, .miniaturizable, .resizable], backing: .buffered, defer: false)
            floatingWindow?.minSize = NSSize(width: 100, height: 0)
            floatingWindow?.isMovableByWindowBackground = true
            floatingWindow?.contentView = webView
            floatingWindow?.hasShadow = false
            floatingWindow?.titlebarSeparatorStyle = .none
            floatingWindow?.delegate = self
            floatingWindow?.level = .floating
            let accessoryVC = TitleBarButtons()
            accessoryVC.layoutAttribute = .right
            floatingWindow?.addTitlebarAccessoryViewController(accessoryVC)
            FloatingController.shared.titleBarButtons = accessoryVC
        } else {
            floatingWindow?.makeKeyAndOrderFront(nil)
        }
    }
    
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        floatingWindow?.orderOut(nil)
        return false
    }
    func toggleFloating() {
        if let window = floatingWindow {
            window.level = (window.level == .floating) ? .normal : .floating
}}
    func toggleAutoHide() {
        isAutoHideEnabled.toggle()
        floatingWindow?.animator().alphaValue = isAutoHideEnabled ? 0.3 : 1.0
        titleBarButtons?.updateButtonAppearance()  // Update the button appearance
    }
        
    
    
    func closeFloatingWindow() {
        floatingWindow?.close()
        floatingWindow = nil
    }
} 
