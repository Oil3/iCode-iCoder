//
//  floating window
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
            floatingWindow = CustomFloatingWindow(contentRect: contentRect, styleMask: [.fullSizeContentView, .closable, .miniaturizable, .resizable, .unifiedTitleAndToolbar, ], backing: .buffered, defer: false)
            floatingWindow?.contentView = webView
//            floatingWindow?.
            floatingWindow?.level = .floating
            floatingWindow?.titlebarAppearsTransparent = true
            floatingWindow?.isMovable = true
//            floatingWindow?.isMovableByWindowBackground = true
            } else {
            floatingWindow?.canHide = true
        }            
    }
    
}
