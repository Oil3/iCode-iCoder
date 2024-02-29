//
//  TitleBarButtons.swift
//  iCode
//
//  Created by ZZS on 29/02/2024.
//

import Cocoa

class TitleBarButtons: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()

        // Create a titlebar accessory view controller
        let accessoryViewController = NSTitlebarAccessoryViewController()
        accessoryViewController.layoutAttribute = .right

        // Create a button (or any custom view) and add it to the accessory view controller's view
        let button = NSButton(title: "My Button", target: self, action: #selector(buttonAction))
        accessoryViewController.view = NSView(frame: NSRect(x: 0, y: 0, width: 100, height: 26)) // Adjust size as needed
        accessoryViewController.view.addSubview(button)

        // Add the accessory view controller to the window
        self.window?.addTitlebarAccessoryViewController(accessoryViewController)
    }

    @objc func buttonAction() {
        // Handle button action
        print("Button clicked")
    }
}
