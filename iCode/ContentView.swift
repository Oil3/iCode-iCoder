
import SwiftUI
import WebKit

struct ContentView: View {
    @AppStorage("selectedURL") var selectedURL: String = "https://chat.openai.com"
    @AppStorage("windowTransparency") var windowTransparency: Double = 1.0
//    @State private var windowTransparency = 1.0


    var body: some View {
        TabView {
            FirstView()
                .tabItem {
                    Label("iCoder", systemImage: "globe")
                }
            SnippetView()
            .tabItem {
                    Label("Snippets", systemImage: "list.bullet")
                }
            DashboardView()
            .tabItem {
                    Label("Settings", systemImage: "gear")
            }
            .tabViewStyle(/*@START_MENU_TOKEN@*/DefaultTabViewStyle()/*@END_MENU_TOKEN@*/)
                    } 
//            .searchable(text: $searchText) // search field 
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: {
                        // Opens the floating window which is the principal window of the app
                    FloatingController.shared.showFloatingWindow()                    }) {
                        Text("iCoder")
                    }
                    .help("Launch iCoder - AI Assistant")
                }
  }
}
            
        }
