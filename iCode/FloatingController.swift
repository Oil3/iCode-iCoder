//iCode
//  FloatingController is iCoder
//
//  Created by ZZS on 18/02/2024.
    //

import Foundation
import WebKit

class FloatingController: NSWindowController, NSWindowDelegate {
    var selectedURL: URL {
        let urlString = UserDefaults.standard.string(forKey: "selectedURL") ?? "https://chat.openai.com"
        return URL(string: urlString)!
    }
    var windowTransparency: Double {
        return UserDefaults.standard.double(forKey: "windowTransparency")
    }
    
    static let shared = FloatingController()
    public var floatingWindow: NSWindow?
    var titleBarButtons: TitleBarButtons? 
    public var searchText: String = ""
// //    ??osoccuper des links?var browserView: BrowserView?



    

    func showFloatingWindow() {
        if floatingWindow == nil {
            let webView = WKWebView()
            webView.load(URLRequest(url: URL(string: "https://chat.openai.com")!))
            webView.allowsMagnification = true
            webView.allowsBackForwardNavigationGestures = true
            webView.pageZoom = (1)
            webView.allowsLinkPreview = true
          // // webView.drawPageBorder(with: NSSize??????????)
         //  // ??webView.createPDF(completionHandler: <#T##(Result<Data, Error>) -> Void#>)
            webView.configuration.preferences.tabFocusesLinks = true
            
            let contentRect = NSRect(x: 1250, y: 400, width: 400, height: 647)
            floatingWindow = NSWindow(contentRect: contentRect, styleMask: [.titled, .closable, .miniaturizable, .resizable], backing: .buffered, defer: false)
            floatingWindow?.backgroundColor = NSColor.black
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
            floatingWindow?.makeKeyAndOrderFront(nil)
        } else {
            floatingWindow?.makeKeyAndOrderFront(nil)
        }
    }
    
    func windowShouldClose(_ sender: NSWindow) -> Bool { //hiding the view of floating window to keep data has to be a  choice, it allows instant reopening but keeps in memory
        floatingWindow?.orderOut(nil)
        return false
    }
    func toggleFloating() {
        if let window = floatingWindow {
            window.level = (window.level == .floating) ? .normal : .floating
}}
    func updateWindowTransparency(to newValue: Double) {
        floatingWindow?.animator().alphaValue = newValue
    }
    
    func performSearch(with searchText: String) {
        guard let webView = floatingWindow?.contentView as? WKWebView else { return }
        if !searchText.isEmpty {
            webView.find(searchText) { result in
                if result.matchFound {
                    print("Match found") //this really to debug
                } else {
                    print("Not found") //this really to debug
            }
        }
    }
}
    
    func closeFloatingWindow() { //maybe we remove that, idea is for ensuring no data loss, but it means te winow is not closed
        floatingWindow?.close()
        floatingWindow = nil
    }
} 

