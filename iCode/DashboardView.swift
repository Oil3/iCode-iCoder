

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
            }
            Section(header: Text("About")) {
                Text("App version: 1.0.0")
            }
        }
    }
}
