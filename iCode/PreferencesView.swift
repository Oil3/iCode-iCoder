//
//  PreferencesView.swift
//  iCode
//
//  Created by ZZS on 18/02/2024.
//
import SwiftUI
import WebKit

struct PreferencesView: View {
    @AppStorage("chatURL") var chatURL: String = "https://default.chat.url"
    @AppStorage("isWindowFloating") var isWindowFloating: Bool = false

    var body: some View {
        Form {
            Button("Clear Cookies", action: clearCookies)
            Toggle("Floating Window", isOn: $isWindowFloating)
            // Add more preferences as needed
            
        }
    }
    
    func clearCookies() {
        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach { record in
            WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {
                    print("Cookies cleared.")
            })
            }
        }
    }
    
    
}
#Preview {
    PreferencesView()
}
