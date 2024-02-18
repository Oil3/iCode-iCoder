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
                ContentView(isSidePanelVisible: .constant(true))
        }
        #if os(macOS)
        .commands {
            SidebarCommands()
        }
        #endif
    }
}
