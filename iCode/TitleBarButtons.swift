
import AppKit

class TitleBarButtons: NSTitlebarAccessoryViewController {
    // Maintain direct references to the buttons
    private var toggleButton: NSButton!
    var transparencySlider: NSSlider!
    var searchText: NSSearchField! //not private to access from elsewhere
    weak var floatingController: FloatingController?



    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Search init
        searchText = NSSearchField(frame: .zero)
        searchText.placeholderString = "Search"
        searchText.target = self
        searchText.action = #selector(searchTextDidChange(_:))
        // Initialize the toggle button with an SF Symbol
        toggleButton = NSButton(image: NSImage(systemSymbolName: "pin", accessibilityDescription: "Stay on top")!, target: self, action: #selector(toggleFloating))
//        toggleButton.bezelStyle = .accessoryBar
        toggleButton.isBordered = false
        
        transparencySlider = NSSlider(value: UserDefaults.standard.double(forKey: "windowTransparency"), 
                                        minValue: 0.1, 
                                        maxValue: 1.0, 
                                        target: self, 
                                        action: #selector(transparencySliderChanged(_:)))
        transparencySlider.isContinuous = true // Update the value continuously while dragging
        self.view.addSubview(transparencySlider)
        
        toggleButton.toolTip = "Toggle Floating (stay-on-top)"
        transparencySlider.toolTip = "Adjust Window Transparency"
        searchText.toolTip = "Search "
        // Set up the view to contain it all, care width
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 198, height: 24))
        self.view.addSubview(toggleButton)
        self.view.addSubview(transparencySlider)
        self.view.addSubview(searchText)

        
        // Position it all within the view
        toggleButton.frame = NSRect(x: 0, y: 0, width: 26, height: 24)
        transparencySlider.frame = NSRect(x: 30, y: 0, width: 50, height: 24)
        searchText.frame = NSRect(x: 90, y: 0, width: 98, height: 24)

        // Set the initial state of the buttons based on the window's current level
        updateButtonAppearance()
    }
    @objc func searchTextDidChange(_ sender: NSSearchField) {
    floatingController?.performSearch(with: sender.stringValue)
}
    @objc func toggleFloating() {
        FloatingController.shared.toggleFloating()
        updateButtonAppearance()
    }
    
    @objc func transparencySliderChanged(_ sender: NSSlider) {
        let newTransparency = sender.doubleValue
        UserDefaults.standard.set(newTransparency, forKey: "windowTransparency")
        floatingController?.updateWindowTransparency(to: newTransparency)
    }
    
    func updateButtonAppearance() {

        let toggleButtonImageName = (FloatingController.shared.floatingWindow?.level == .floating) ? "pin.fill" : "pin.slash.fill"
        toggleButton.image = NSImage(systemSymbolName: toggleButtonImageName, accessibilityDescription: nil)
        
//        let transparencyButtonImageName = (FloatingController.shared.isTransparencyEnabled) ? "square.on.square.fill" : "square.on.square.intersection.dashed"
//        transparencyButton.image = NSImage(systemSymbolName: transparencyButtonImageName, accessibilityDescription: nil)
}}
