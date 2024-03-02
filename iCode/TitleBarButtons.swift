//
//  TitleBarButtons.swift
//  iCode
//
//  Created by ZZS on 29/02/2024.
//
import AppKit

class TitleBarButtons: NSTitlebarAccessoryViewController {
    // Maintain direct references to the buttons
    private var toggleButton: NSButton!
    private var autoHideButton: NSButton!
    private var searchText: NSSearchField!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Search init
        searchText = NSSearchField(frame: .zero)
        searchText.placeholderString = "Search"

        // Initialize the toggle button with an SF Symbol
        toggleButton = NSButton(image: NSImage(systemSymbolName: "pin", accessibilityDescription: nil)!, target: self, action: #selector(toggleFloating))
        toggleButton.bezelStyle = .texturedRounded
        toggleButton.isBordered = false
        
        // Initialize the auto-hide button with an SF Symbol
        autoHideButton = NSButton(image: NSImage(systemSymbolName: "eye.slash", accessibilityDescription: nil)!, target: self, action: #selector(toggleAutoHide))
        autoHideButton.bezelStyle = .texturedRounded
        autoHideButton.isBordered = false
        
        // Set up the view to contain it all
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 60, height: 26))
        self.view.addSubview(toggleButton)
        self.view.addSubview(autoHideButton)
        self.view.addSubview(searchText)

        
        // Position the buttons within the view
        toggleButton.frame = NSRect(x: 0, y: 0, width: 30, height: 26)
        autoHideButton.frame = NSRect(x: 30, y: 0, width: 30, height: 26)
        
        // Set the initial state of the buttons based on the window's current level
        updateButtonAppearance()
    }
    
    @objc func toggleFloating() {
        FloatingController.shared.toggleFloating()
        updateButtonAppearance()
    }
    
    @objc func toggleAutoHide() {
        FloatingController.shared.toggleAutoHide()
    }
    
    func updateButtonAppearance() {

        let toggleButtonImageName = (FloatingController.shared.floatingWindow?.level == .floating) ? "pin.fill" : "pin.slash.fill"
        toggleButton.image = NSImage(systemSymbolName: toggleButtonImageName, accessibilityDescription: nil)
        
        let autoHideButtonImageName = (FloatingController.shared.isAutoHideEnabled) ? "eye.slash.rfill" : "eye.fill"
        autoHideButton.image = NSImage(systemSymbolName: autoHideButtonImageName, accessibilityDescription: nil)
}}

