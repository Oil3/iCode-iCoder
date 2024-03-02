    //
    //  File.swift
    //  iCode
    //
    //  Created by ZZS on 02/03/2024.
    //

    import SwiftUI
    public extension Color {

    #if os(macOS)
    static let backgroundColor = Color(NSColor.windowBackgroundColor)
    static let secondaryBackgroundColor = Color(NSColor.controlBackgroundColor)
    #else
    static let backgroundColor = Color(UIColor.systemBackground)
    static let secondaryBackgroundColor = Color(UIColor.secondarySystemBackground)
    #endif
    }

    public struct CustomTabView: View {

        public enum TabBarPosition {
            case top
            case bottom
        }
        
        private let tabBarPosition: TabBarPosition
        private let tabText: [String]
        private let tabIconNames: [String]
        private let tabViews: [AnyView]
        
        @State private var selection = 0
        
        public init(tabBarPosition: TabBarPosition, content: [(tabText: String, tabIconName: String, view: AnyView)]) {
            self.tabBarPosition = tabBarPosition
            self.tabText = content.map { $0.tabText }
            self.tabIconNames = content.map { $0.tabIconName }
            self.tabViews = content.map { $0.view }
        }
        
        public var tabBar: some View {
            HStack {
                Spacer()
                ForEach(0..<tabText.count, id: \.self) { index in
                    VStack {
                        Image(systemName: self.tabIconNames[index])
                        Text(self.tabText[index])
                    }
                    .padding()
                    .foregroundColor(self.selection == index ? .accentColor : .primary)
                    .background(Color.secondaryBackgroundColor)
                    .cornerRadius(8) // Optional: for rounded corners
                    .onTapGesture {
                        self.selection = index
                    }
                }
                Spacer()
            }
            .background(Color.secondaryBackgroundColor)
            // Removed all shadow modifiers
            .zIndex(1) // Use zIndex to layer the tabBar above or below other content if needed
        }
        
        public var body: some View {
            VStack(spacing: 0) {
                if tabBarPosition == .top {
                    tabBar
                }
                
                tabViews[selection]
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                if tabBarPosition == .bottom {
                    tabBar
                }
            }
        }
    }
