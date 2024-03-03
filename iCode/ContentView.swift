
import SwiftUI
import WebKit

struct ContentView: View {
    @AppStorage("selectedURL") var selectedURL: String = "https://chat.openai.com"
    @AppStorage("windowTransparency") var windowTransparency: Double = 1.0
//    @State private var windowTransparency = 1.0


    var body: some View {
    
        TabView {
            DashboardView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            SnippetView()
            .tabItem {
                    Label("Snippets", systemImage: "list.bullet")
                }
            FirstView()
            .tabItem {
                    Label("iCoder", systemImage: "globe")
            }
            .tabViewStyle(/*@START_MENU_TOKEN@*/DefaultTabViewStyle()/*@END_MENU_TOKEN@*/)
                    } 
//            .searchable(text: $searchText) // search field 
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: {
                        // Open the window when the button is clicked
                    FloatingController.shared.showFloatingWindow()                    }) {
                        Text("Launch iCoder assistant")
                    }   
                }
  }          }
            
        }
