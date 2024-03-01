//
//  TitleBarAccesorryViewController.swift
//  iCode
//
//   to instantiate:
////     let accessoryVC = TitleBarAccessoryViewController()
////     accessoryVC.layoutAttribute = .right    
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
        
    let Button1 = createButton(title: "x", color: .systemRed, tag: 1)
    let Button2 = createButton(title: "-", color: .systemYellow, tag: 2)
    let Button3 = createButton(title: "<>", color: .systemGreen, tag: 3)
        
        stackView.addArrangedSubview(Button1)
        stackView.addArrangedSubview(Button2)
        stackView.addArrangedSubview(Button3)
        
        self.view = stackView
    }
    
    private func createButton(title: String, color: NSColor, tag: Int) -> NSButton {
        let button = NSButton(title: title, target: self, action: #selector(buttonAction(_:)))
        button.bezelStyle = .rounded
        button.tag = tag 
        return button
    }

    
    @objc private func buttonAction(_ sender: NSButton) {
        guard let window = view.window else { return }

        switch sender.tag {
        case 1:
            FloatingController.shared.toggleFloating()

        case 2: 
            FloatingController.shared.toggleAutoHide()
        case 3: // Maximize or Zoom
            window.performZoom(sender)
        default:
            break
            }}
}

            //this in another file
//            //uses the TitleBarAccessoryViewController.swift for consistent buttons
//            let accessoryVC = TitleBarAccessoryViewController()
//            accessoryVC.layoutAttribute = .right 
//            floatingWindow?.addTitlebarAccessoryViewController(accessoryVC) 

//            // Create a titlebar accessory view controller with a button
//            let accessoryViewController = NSTitlebarAccessoryViewController()
//            accessoryViewController.layoutAttribute = .right
//
//            let button = NSButton(title: "X", target: nil, action: #selector(titleBarButtonClicked))
//            button.bezelStyle = .circular
//            accessoryViewController.view = NSView(frame: NSRect(x: 0, y: 0, width: 100, height: 20))
//            accessoryViewController.view.addSubview(button)
//            // Add the accessory view controller to the window
//            floatingWindow?.addTitlebarAccessoryViewController(accessoryViewController)
            //action
//    @objc func titleBarButtonClicked() {
//        print("Title bar button clicked")
//    }
