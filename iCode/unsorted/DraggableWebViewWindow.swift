import Cocoa
import WebKit

class DraggableWebViewWindow: NSWindow {
    private var initialMouseLocation: NSPoint?

    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: [.borderless], backing: backingStoreType, defer: flag)
        self.isMovableByWindowBackground = true
        self.isMovable = true
    }

    override func mouseDown(with event: NSEvent) {
        // Record the window's current location
        self.initialMouseLocation = event.locationInWindow
    }

    override func mouseDragged(with event: NSEvent) {
        guard let initialMouseLocation = initialMouseLocation else { return }

        let currentLocation = event.locationInWindow
        let dx = currentLocation.x - initialMouseLocation.x
        let dy = currentLocation.y - initialMouseLocation.y

        var newOrigin = self.frame.origin
        newOrigin.x += dx
        newOrigin.y += dy

        // Prevent the window from being dragged to the menu bar on macOS
        let screenVisibleFrame = self.screen?.visibleFrame ?? NSRect.zero
        let windowFrame = self.frame
        let newMaxY = newOrigin.y + windowFrame.size.height
        if (newMaxY > (screenVisibleFrame.origin.y + screenVisibleFrame.size.height)) {
            newOrigin.y = screenVisibleFrame.origin.y + (screenVisibleFrame.size.height - windowFrame.size.height)
        }
        
        self.setFrameOrigin(newOrigin)
    }
}
