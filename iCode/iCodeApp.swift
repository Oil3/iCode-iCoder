
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
                Menu("Find") {
                    Button("Find...") {
                        // Implement find action
                        //FloatingController.shared.performSearch(with: FloatingController.shared.searchText)
                    }
                    .keyboardShortcut("f", modifiers: .command)

                    Button("Find Next") {
                        // Implement find next action
                    }
                    .keyboardShortcut("g", modifiers: .command)
                }
            }
        }
    }
}

