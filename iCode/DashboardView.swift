
import SwiftUI

struct DashboardView: View {
    @AppStorage("appearanceMode") var appearanceMode = "Dark"
    @AppStorage("windowTransparency") var windowTransparency: Double = 1.0
    @AppStorage("selectedURL") var selectedURL: String = "https://chat.openai.com"

//    @Binding var selectedURL: URL
//    @Binding var windowTransparency: Double

    var body: some View {
    
        VStack {
            Section(header: Text("Quick Start")) {
                Text("Launch iCoder from title bar, log-in. Shift+Return makes new line, Cmd+Return sends prompt, Cmd+H hides app and floating window, Cmd+Shift+H hides all other apps (also works from other apps such as Xcode), toggle transparency and float window on top of other windows from the title bar of the AI Assistant. ")
            }
            Picker("Appearance Mode", selection: $appearanceMode) {
                Text("Dark").tag("Dark")
                Text("Light").tag("Light")
            }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: appearanceMode) { newValue, _ in
                if newValue == "Dark" {
                    NSApp.appearance = NSAppearance(named: .darkAqua)
                } else {
                    NSApp.appearance = NSAppearance(named: .aqua)
                }
            }

            TextField("Enter AI URL", text: Binding<String>(
                get: { self.selectedURL },
                set: { newValue in
                    if let newURL = URL(string: newValue), newURL.scheme == "https" || newURL.scheme == "http" {
                        self.selectedURL = newValue }
                    }
                ))
            .frame(width: 200)
            
            Slider(value: $windowTransparency, in: 0.1...1.0, step: 0.1) 
                .frame(width: 200)
            Text("Transparency: \(Int(windowTransparency * 100))%")
                
            Button("Clear Cookies") {
                WebDataCleaner.clearCookies {
                    print("Cookies cleared.")
                    }
                }
            Button("Clear All Web Data") {
                WebDataCleaner.clearAllData {
                    print("All website data cleared.")
                    }
                }
                .padding(.top, 5) // Add padding for visual separation
            }
            Section(header: Text("About")) {
                Text("App version: 1.0.0")
            }
        }

}
