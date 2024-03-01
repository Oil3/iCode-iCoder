//
//  TitleBarButtons.swift
//  iCode
//
//  Created by ZZS on 29/02/2024.
//
import Cocoa

class TitleBarButtons: NSTitlebarAccessoryViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the toggle button
        let toggleButton = NSButton(image: NSImage(named: NSImage.Name("FloatingIcon"))!, target: self, action: #selector(toggleFloating))
        toggleButton.bezelStyle = .texturedRounded
        toggleButton.isBordered = false // Adjust based on your design
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 30, height: 26))
        self.view.addSubview(toggleButton)
        
        // Set initial state
        updateButtonAppearance()
    }
    
    @objc func toggleFloating() {
        guard let window = self.view.window as? BorderlessDrag else { return }
        window.level = (window.level == .floating) ? .normal : .floating
        updateButtonAppearance()
        
        // Update window title based on state
        window.title = (window.level == .floating) ? "" : "Floating Window"
    }
    
    func updateButtonAppearance() {
        guard let window = self.view.window as? BorderlessDrag else { return }
        // Assuming you have references to your buttons or can access them
        let buttonImageName = (window.level == .floating) ? "pin" : "pin.fill"
        if let button = self.view.subviews.compactMap({ $0 as? NSButton }).first { // Example to find the button
            button.image = NSImage(systemSymbolName: buttonImageName, accessibilityDescription: nil)
        }
    }}

