///ZZZ
//quite the rollercoaster to have it borderless, floating, and interactive. Not borderless = 0 issue. Might need to have it as an option 
import AppKit
import WebKit
import Foundation

class FloatingController: NSWindowController {
    static let shared = FloatingController()
    var floatingWindow: NSWindow?

    func showFloatingWindow() {
        if floatingWindow == nil {
            let webView = WKWebView()
            webView.load(URLRequest(url: URL(string: "https://chat.openai.com")!))

            let contentRect = NSRect(x: 0, y: 0, width: 480, height: 800)
            floatingWindow = NSWindow(contentRect: contentRect, styleMask: [.titled, .closable, .miniaturizable, .resizable], backing: .buffered, defer: false)
            floatingWindow?.contentViewController = NSViewController()
            floatingWindow?.contentViewController?.view = webView
            floatingWindow?.level = .floating
            floatingWindow?.backgroundColor = .black
            floatingWindow?.isMovableByWindowBackground = true
            floatingWindow?.title = "Floating Window"

            self.window = floatingWindow // Ensure the NSWindowController manages the floatingWindow
        }
        floatingWindow?.makeKeyAndOrderFront(nil)
    }
}

