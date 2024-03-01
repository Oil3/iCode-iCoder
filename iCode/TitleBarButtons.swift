//
//  TitleBarButtons.swift
//  iCode
//
//  Created by ZZS on 29/02/2024.
//
import Cocoa

class TitleBarButtons: NSTitlebarAccessoryViewController {
    // Maintain a direct reference to the toggle button
    private var toggleButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the toggle button with an SF Symbol
        toggleButton = NSButton(image: NSImage(systemSymbolName: "pin", accessibilityDescription: nil)!, target: self, action: #selector(toggleFloating))
        toggleButton.bezelStyle = .texturedRounded
        toggleButton.isBordered = false
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 30, height: 26))
        self.view.addSubview(toggleButton)
        
        // Set the initial state of the button based on the window's current level
        updateButtonAppearance()
    }
    
    @objc func toggleFloating() {
        guard let window = self.view.window as? BorderlessDrag else { return }
        window.level = (window.level == .floating) ? .normal : .floating
        
        // Update the window title and button appearance based on the new state
        window.title = (window.level == .floating) ? "" : "Floating Window"
        updateButtonAppearance()
    }
    
    func updateButtonAppearance() {
        let buttonImageName = (self.view.window?.level == .floating) ? "pin.slash.fill" : "pin.fill"
        toggleButton.image = NSImage(systemSymbolName: buttonImageName, accessibilityDescription: nil)
    }
}


