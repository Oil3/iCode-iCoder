//
//  iCodeApp.swift
//  iCode
//
//  Created by ZZS on 17/02/2024.
//

import SwiftUI

@main
struct iCodeApp: App {  
    var body: some Scene {
            WindowGroup {
            ContentView()
        } 
        .commands {
        CommandGroup(after: .textEditing) {
        Menu("Find") {
        Button("Find...") {
        // Implement find action
        FloatingController.shared.performSearch(with: FloatingController.shared.searchText)
        }
        .keyboardShortcut("f", modifiers: .command)
        Button("Find Next") {
                    // Implement find next action
                }
                .keyboardShortcut("g", modifiers: .command)
            }
    
}}}}
