//iCode
//  FloatingController is iCoder
//
//  Created by ZZS on 18/02/2024.
    //

import Foundation
import WebKit

class FloatingController: NSWindowController, NSWindowDelegate {
    static let shared = FloatingController()
    public var floatingWindow: NSWindow?
    var titleBarButtons: TitleBarButtons? 
    var isAutoHideEnabled = false
    var searchText: String = ""

    

    func showFloatingWindow() {
        if floatingWindow == nil {
            let webView = WKWebView()
            webView.load(URLRequest(url: URL(string: "https://chat.openai.com")!))
            webView.allowsMagnification = true
            webView.allowsBackForwardNavigationGestures = true
            webView.pageZoom = (0.9)
            webView.configuration.preferences.tabFocusesLinks = true
            
            let contentRect = NSRect(x: 1250, y: 400, width: 400, height: 647)
            floatingWindow = NSWindow(contentRect: contentRect, styleMask: [.titled, .closable, .miniaturizable, .resizable], backing: .buffered, defer: false)
            floatingWindow?.minSize = NSSize(width: 100, height: 0)
            floatingWindow?.isMovableByWindowBackground = true
            floatingWindow?.contentView = webView
            floatingWindow?.hasShadow = false
            floatingWindow?.titlebarSeparatorStyle = .none
            floatingWindow?.delegate = self
            floatingWindow?.level = .floating
            floatingWindow?.titleVisibility = .hidden
            floatingWindow?.title = "iCoder"
            let accessoryVC = TitleBarButtons()
            accessoryVC.layoutAttribute = .right
            accessoryVC.floatingController = self
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
        titleBarButtons?.updateButtonAppearance() 
    }
    func performSearch(with searchText: String) {
        guard let webView = floatingWindow?.contentView as? WKWebView else { return }

        if !searchText.isEmpty {
            let findConfiguration = WKFindConfiguration()
            findConfiguration.caseSensitive = false
            findConfiguration.wraps = true
            webView.find(searchText, configuration: findConfiguration) { result in
                // Handle the results of the search
                print("Matches found: \(result)")
        }
    }
}    
    
    func closeFloatingWindow() {
        floatingWindow?.close()
        floatingWindow = nil
    }
} 
