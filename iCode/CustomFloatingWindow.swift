//
//  CustomFloatingWindow.swift
//  iCode
//
//  Created by ZZS on 28/02/2024.
//

import Foundation
import Cocoa

class CustomFloatingWindow: NSWindow {
    override func mouseDown(with event: NSEvent) {
        self.performDrag(with: event)
    }
}
