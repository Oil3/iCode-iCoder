//
//  DashboardView.swift
//  iCode
//
//  Created by ZZS on 18/02/2024.
//

import SwiftUI

struct DashboardView: View {
    @Binding var defaultURL: String
    @Binding var windowTransparency: Double

    var body: some View {
        Form {
            Section(header: Text("Quick Start")) {
                Text("Learn how to get started with the app...")
            }
            Section(header: Text("Settings")) {
                TextField("Default URL", text: $defaultURL)
                Slider(value: $windowTransparency, in: 0.1...1.0, step: 0.1) {
                    Text("Window Transparency")
                }
                .disabled(false) // Update based on your logic
            }
            Section(header: Text("About")) {
                Text("App version: 1.0.0")
                // Additional info
            }
        }
    }
}

