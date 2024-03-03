
import SwiftUI

@main
struct iCodeApp: App {
    @State private var selectedURL = URL(string: "https://chat.openai.com")! // Initialize with a default URL

    var body: some Scene {
        WindowGroup {
            ContentView(selectedURL: $selectedURL)
        }
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

