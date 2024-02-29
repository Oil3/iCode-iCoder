
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
            webView.load(URLRequest(url: URL(string: "https://chat.openai.com")!))

            let contentRect = NSRect(x: 1250, y: 400, width: 400, height: 647)
            floatingWindow = BorderlessDrag(contentRect: contentRect, styleMask: [.titled, .closable, .miniaturizable, .resizable], backing: .buffered, defer: false)
//            floatingWindow?.level = .floating               
//            floatingWindow?.titlebarAppearsTransparent = true
            floatingWindow!.isMovable = true
            floatingWindow!.isMovableByWindowBackground = true
            floatingWindow?.contentView = webView
            floatingWindow?.makeKeyAndOrderFront(nil)
            floatingWindow?.level = .modalPanel           
            //
            
            let accessoryVC = TitleBarAccessoryViewController()
            accessoryVC.layoutAttribute = .right 
            floatingWindow?.addTitlebarAccessoryViewController(accessoryVC) 
//            // Create a titlebar accessory view controller with a button
//            let accessoryViewController = NSTitlebarAccessoryViewController()
//            accessoryViewController.layoutAttribute = .right
//
//            let button = NSButton(title: "X", target: nil, action: #selector(titleBarButtonClicked))
//            button.bezelStyle = .circular
//            accessoryViewController.view = NSView(frame: NSRect(x: 0, y: 0, width: 100, height: 20))
//            accessoryViewController.view.addSubview(button)
//            // Add the accessory view controller to the window
//            floatingWindow?.addTitlebarAccessoryViewController(accessoryViewController)
            //
            floatingWindow?.makeKeyAndOrderFront(nil) 
        } else {
            floatingWindow?.makeKey()
        }
    }

    @objc func titleBarButtonClicked() {
        print("Title bar button clicked")
    }
}
