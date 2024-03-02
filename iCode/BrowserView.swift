
import SwiftUI
import WebKit

struct BrowserView: NSViewRepresentable {
    @Binding var url: URL // Now dynamic
    @Binding var searchText: String

    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        // Load the URL if it's not already loaded
        if nsView.url?.absoluteString != url.absoluteString {
            let request = URLRequest(url: url)
            nsView.load(request)
        }
                
        // Search functionality
        if !searchText.isEmpty {    
            let findConfiguration = WKFindConfiguration()
            findConfiguration.caseSensitive = false
            findConfiguration.wraps = true
            nsView.find(searchText, configuration: findConfiguration) { result in
                print("Matches found: \(result)")
            }
        }
    }
}
