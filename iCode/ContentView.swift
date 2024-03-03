
import SwiftUI
import WebKit

struct ContentView: View {
    @Binding var selectedURL: URL // Now dynamic
    @State private var searchText = ""
    @State private var windowTransparency = 1.0


    var body: some View {
    
        TabView {
            DashboardView(selectedURL: $selectedURL, windowTransparency: $windowTransparency)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            SnippetView()
            .tabItem {
                    Label("Snippets", systemImage: "list.bullet")
                }
            BrowserView(url: $selectedURL, searchText: $searchText )
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
