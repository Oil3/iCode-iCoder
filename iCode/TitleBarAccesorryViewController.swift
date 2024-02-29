//
//  TitleBarAccesorryViewController.swift
//  iCode
//
////     let accessoryVC = TitleBarAccessoryViewController()
////     accessoryVC.layoutAttribute = .right    //The layoutAttribute determines where the accessory view will be placed in the title bar
////     window.addTitlebarAccessoryViewController(accessoryVC) 
//  Created by ZZS on 29/02/2024.
//

import AppKit

class TitleBarAccessoryViewController: NSTitlebarAccessoryViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackView = NSStackView(frame: NSRect(x: 0, y: 0, width: 120, height: 26))
        stackView.orientation = .horizontal
        stackView.distribution = .equalSpacing
        
        // To use symbols, replace title parameter with SF Symbol name, and load the symbol using NSImage(systemSymbolName:accessibilityDescription:) if available.
        let closeButton = createButton(title: "⨉", color: .systemRed, tag: 1)
        let minimizeButton = createButton(title: "➖", color: .systemYellow, tag: 2)
        let maximizeButton = createButton(title: "⬜️", color: .systemGreen, tag: 3)
        
        stackView.addArrangedSubview(closeButton)
        stackView.addArrangedSubview(minimizeButton)
        stackView.addArrangedSubview(maximizeButton)
        
        self.view = stackView
    }
    
    private func createButton(title: String, color: NSColor, tag: Int) -> NSButton {
        let button = NSButton(title: title, target: self, action: #selector(buttonAction(_:)))
        button.bezelStyle = .rounded
//        button.backgroundColor = color
        button.tag = tag // Assign the tag
        return button
}
    
    
    @objc private func buttonAction(_ sender: NSButton) {
        print("Button clicked")
        
        // Here, you'd handle the action based on which button was clicked.
        // For example, you might close, minimize, or maximize the window.
    }
}
