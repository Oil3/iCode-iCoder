
import SwiftUI

struct DashboardView: View {
    @Binding var selectedURL: URL
    @Binding var windowTransparency: Double

    var body: some View {
        Form {
            Section(header: Text("Quick Start")) {
                Text("Learn how to get started with the app...")
            }
            Section(header: Text("Settings")) {
                TextField("Default URL", text: Binding<String>(
                    get: { self.selectedURL.absoluteString },
                    set: { newValue in
                        if let newURL = URL(string: newValue) {
                            self.selectedURL = newURL
                        }
                    }
                ))
                Slider(value: $windowTransparency, in: 0.1...1.0, step: 0.1) {
                    Text("Window Transparency")
                }
                Button("Clear Cookies") {
                    WebDataCleaner.clearCookies {
                        print("Cookies cleared.")
                    }
                }
                Button("Clear All Data") {
                    WebDataCleaner.clearAllData {
                        print("All website data cleared.")
                    }
                }.padding(.top, 5) // Add padding for visual separation
            }
            Section(header: Text("About")) {
                Text("App version: 1.0.0")
            }
        }
    }
}
