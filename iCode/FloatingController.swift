///ZZZ
//quite the rollercoaster to have it borderless, floating, and interactive. Not borderless = 0 issue. Might need to have it as an option 
import SwiftUI
import WebKit

// Extension for draggable functionality
@available(OSX 11.0, *)
extension View {
    func dragWndWithClick() -> some View {
        self.overlay(DragWndView())
    }
}

struct DragWndView: View {
    let test: Bool = false
    
    var body: some View {
        (test ? Color.green : Color.clear) // Using clear for no visual change
            .overlay(DragWndNSRepr())
    }
}

fileprivate struct DragWndNSRepr: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        DragWndNSView()
    }
    
    func updateNSView(_ nsView: NSView, context: Context) { }
}

fileprivate class DragWndNSView: NSView {
    override public func mouseDown(with event: NSEvent) {
        window?.performDrag(with: event)
    }
}

// SwiftUI View for WKWebView
struct InteractiveWebView: NSViewRepresentable {
    let url: URL
    
    func makeNSView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        nsView.load(request)
    }
}

// Main View with Draggable Functionality
struct DraggableWebViewContainer: View {
    var body: some View {
        InteractiveWebView(url: URL(string: "https://www.example.com")!)
            .frame(width: 800, height: 600)
            .dragWndWithClick()
    }
}

// Custom NSWindow for a borderless, floating window
class FloatingWebViewWindow: NSWindow {
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: [.borderless], backing: backingStoreType, defer: flag)
        self.isOpaque = false
        self.backgroundColor = NSColor.clear
        self.level = .floating
        self.makeKeyAndOrderFront(nil)
    }
}

// App Delegate to Setup Custom Window
@main
struct WebViewApp: App {
    var body: some Scene {
        WindowGroup {
            DraggableWebViewContainer()
        }
    }
}
