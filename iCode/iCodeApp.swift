
import SwiftUI

@main
struct iCodeApp: App {
    @AppStorage("selectedURL") var selectedURLString: String = "https://chat.openai.com"
    @AppStorage("appearanceMode") var appearanceMode = "Dark"


    var body: some Scene {
        WindowGroup {
            ContentView()
        
        .onAppear {
            if appearanceMode == "Dark" {
                NSApp.appearance = NSAppearance(named: .darkAqua)
            } else {
                NSApp.appearance = NSAppearance(named: .aqua)
            }
        }}
        .commands {
            CommandGroup(after: .textEditing) {
                    Button("Find... ") {
                        FloatingController.shared.titleBarButtons?.searchText.becomeFirstResponder()
                    }
                    .keyboardShortcut("f", modifiers: .command)

                    Button("Find Next") {
                        if let searchText = FloatingController.shared.titleBarButtons?.searchText.stringValue {
                            FloatingController.shared.performSearch(with: searchText)

                    }}
                    .keyboardShortcut("g", modifiers: .command)
                
            }
        }
    
}}

