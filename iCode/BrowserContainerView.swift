//
//  BrowserContainerView.swift
//  iCode
//
//  Created by ZZS on 18/02/2024.
//

import SwiftUI

struct BrowserContainerView: View {
    @Binding var searchText: String

    var body: some View {

        BrowserView(searchText: $searchText)
    }
}
