//
//  SidePanelView.swift
//  iCode
//
//  Created by ZZS on 17/02/2024.
//

import SwiftUI

struct SidePanelView: View {
    @Binding var selectedCategory: Category?
    @Binding var isSidePanelVisible: Bool

    
    var body: some View {
        VStack {
            Spacer() //we put the categories at the bottom
            
       // List(selection: $selectedCategory) {
            ForEach(Category.allCases) { category in
                Button(action: {
                    self.selectedCategory = category
                    self.isSidePanelVisible.toggle()
                }) {
                    HStack {
                        Image(systemName: category.systemIconName) // Assuming you have icons for each category
                            .frame(width: 30, alignment: .leading)
                        
                        Text(category.localizedName)
                            .fontWeight(.medium)
                        
                        Spacer() // Align text and icon to the left
                    }
                }
                .buttonStyle(PlainButtonStyle()) // This makes the button look like a list item
                .padding(.vertical, 4)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color(NSColor.controlBackgroundColor)) // Use NSColor for macOS views
        .border(Color.gray.opacity(0.2), width: 1) // Optional border for better definition
    }
}
extension Category {
    var systemIconName: String {
        switch self {
        case .chat:
            return "message"
        case .snippet:
            return "note.text"
        case .history:
            return "clock"
        case .profile:
            return "person.crop.circle"
        case .settings:
            return "gear"
        case .more:
            return "ellipsis.circle"
        }
    }
}
//        .listStyle(SidebarListStyle())
//        .frame(minWidth: 150, idealWidth: 200, maxWidth: 300)
//
struct SidePanelView_Previews: PreviewProvider {
    static var previews: some View {
        SidePanelView(selectedCategory: .constant(.chat), isSidePanelVisible: .constant(true))
    }
}
